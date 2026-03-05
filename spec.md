# MindEase – Student Mental Wellness Platform

## Current State
New project. No existing code.

## Requested Changes (Diff)

### Add
- **Stress Button**: Full-screen one-tap button that triggers a 60-second reset routine with three phases: breathing animation (box/circle animation), grounding exercise (5-4-3-2-1 prompt), and a motivational message. Timer countdown visible.
- **Daily Emotional Check-In**: Mood tracker with emoji selection (😊😐😞😫) and a 1–5 stress level slider. Submissions stored per user session (anonymous). Weekly mood pattern view as a simple chart or emoji grid.
- **Anonymous Positivity Wall**: Students post short supportive messages (max 120 chars). Messages stored in backend. Displayed as a card wall. No user identity stored or shown.
- **Landing / Home Page**: Hero section with tagline "Support shouldn't take an appointment — it should take one tap." Navigation to the three features.

### Modify
N/A

### Remove
N/A

## Implementation Plan
1. Backend canister:
   - Store anonymous positivity wall messages (text, timestamp)
   - Store daily mood check-in entries (mood enum, stress level 1-5, date)
   - Query: get all wall messages, get last 7 days of check-ins

2. Frontend pages/sections:
   - Home/hero with three feature cards as nav entry points
   - Stress Button page: animated breathing circle, phase progression (breathing → grounding → motivation), 60s countdown
   - Check-In page: emoji mood selector, stress level slider, submit; weekly mood history grid
   - Positivity Wall page: message input form, card grid of messages
