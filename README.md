# A/L Study Companion

AI-powered study companion for Sri Lankan GCE Advanced Level students in the Maths stream (Combined Mathematics, Physics, Chemistry).

## Features

- **Past Paper Question Bank**: Browse and practice questions organized by Subject → Year → Paper → Part
- **AI Explanations**: Get detailed explanations in Sinhala and English, aligned with marking schemes
- **Smart Quiz Mode**: Timed quizzes with different modes (Quick, Focused, Exam Simulation)
- **Weakness Tracking**: Identify and focus on weak topics with visual analytics
- **Ask AI Tutor**: Chat with an AI tutor specialized in A/L subjects
- **Bilingual Support**: Full support for Sinhala and English languages

## Tech Stack

- **Frontend**: Next.js 14 (App Router), TypeScript, Tailwind CSS, shadcn/ui
- **Backend**: Next.js API Routes, Supabase
- **Database**: PostgreSQL via Supabase
- **AI**: Google Gemini API
- **Authentication**: Supabase Auth

## Getting Started

### Prerequisites

- Node.js 18+ installed
- Supabase account
- Google Cloud account (for Gemini API)

### Installation

1. Clone the repository:
```bash
cd al-study-companion
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment variables:
```bash
cp .env.local.example .env.local
```

Edit `.env.local` with your credentials:
```
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
GEMINI_API_KEY=your_gemini_api_key
```

4. Set up Supabase database:
   - Create a new Supabase project
   - Run the migrations in `supabase/migrations/` in order:
     1. `001_initial_schema.sql` - Creates tables and RLS policies
     2. `002_seed_data.sql` - Adds subjects and topics
     3. `003_sample_questions.sql` - Adds sample questions

5. Run the development server:
```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to see the application.

## Project Structure

```
al-study-companion/
├── src/
│   ├── app/                    # Next.js App Router
│   │   ├── (auth)/             # Auth pages (login, signup)
│   │   ├── (dashboard)/        # Protected routes
│   │   │   ├── practice/       # Question practice
│   │   │   ├── quiz/           # Quiz mode
│   │   │   ├── weakness/       # Progress tracking
│   │   │   └── chat/           # AI chat
│   │   └── api/                # API routes
│   ├── components/
│   │   ├── ui/                 # shadcn/ui components
│   │   ├── questions/          # Question components
│   │   ├── explanation/        # AI explanation display
│   │   └── dashboard/          # Dashboard widgets
│   ├── lib/
│   │   ├── supabase/           # Supabase client
│   │   └── gemini/             # Gemini API & prompts
│   ├── hooks/                  # Custom React hooks
│   └── types/                  # TypeScript types
├── supabase/
│   └── migrations/             # Database migrations
└── public/                     # Static assets
```

## Exam Structure Supported

### Combined Mathematics
- Paper I & II: Part A (10 × 25 marks) + Part B (5 of 7 × 150 marks)

### Physics
- Paper I: 50 MCQs × 1 mark
- Paper II: Part A (4 × 20 marks) + Part B (4 × 30 marks)

### Chemistry
- Paper I: 50 MCQs × 1 mark
- Paper II: Part A (4 × 100), Part B (2/3 × 150), Part C (2/3 × 150)

## AI Prompts

The application uses specialized prompts for:
- MCQ explanations (why correct, why others wrong)
- Numerical/structured question solutions (step-by-step with mark allocation)
- Essay questions (model answers with keyword highlights)
- Bilingual output (natural academic Sinhala, not literal translations)

## Contributing

Contributions are welcome! Please read the contributing guidelines before submitting PRs.

## License

This project is for educational purposes. Past paper content belongs to respective examination authorities.

## Support

For questions or issues, please open a GitHub issue.
