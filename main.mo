import Int "mo:core/Int";
import Nat "mo:core/Nat";
import List "mo:core/List";
import Time "mo:core/Time";
import Array "mo:core/Array";
import Order "mo:core/Order";
import Runtime "mo:core/Runtime";

actor {
  type PositivityEntry = {
    message : Text;
    timestamp : Time.Time;
  };

  type MoodEntry = {
    mood : Text;
    stress : Nat;
    timestamp : Time.Time;
  };

  module MoodEntry {
    public func compareByTimestamp(a : MoodEntry, b : MoodEntry) : Order.Order {
      Int.compare(b.timestamp, a.timestamp);
    };
  };

  let positivityWall = List.empty<PositivityEntry>();
  let moodCheckIns = List.empty<MoodEntry>();

  public shared ({ caller }) func addPositivityMessage(message : Text) : async () {
    if (message == "") { Runtime.trap("Message cannot be empty") };
    let entry : PositivityEntry = {
      message;
      timestamp = Time.now();
    };
    positivityWall.add(entry);
  };

  public query ({ caller }) func getAllPositivityMessages() : async [PositivityEntry] {
    positivityWall.toArray();
  };

  public shared ({ caller }) func addMoodEntry(mood : Text, stress : Nat) : async () {
    if (mood == "") { Runtime.trap("Mood cannot be empty") };
    if (stress < 1 or stress > 5) { Runtime.trap("Stress must be between 1 and 5") };

    let entry : MoodEntry = {
      mood;
      stress;
      timestamp = Time.now();
    };
    moodCheckIns.add(entry);
  };

  public query ({ caller }) func getLast7MoodEntries() : async [MoodEntry] {
    let entries = moodCheckIns.toArray().sort(MoodEntry.compareByTimestamp);
    entries.sliceToArray(0, Nat.min(7, entries.size()));
  };
};
