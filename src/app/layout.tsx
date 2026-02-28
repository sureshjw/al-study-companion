import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { Toaster } from "@/components/ui/toaster";
import { ThemeProvider } from "@/components/theme-provider";

const inter = Inter({ subsets: ["latin"], variable: "--font-inter" });

export const metadata: Metadata = {
  title: "A/L Study Companion | Sinhala + English AI Tutor",
  description:
    "AI-powered study companion for Sri Lankan GCE A/L Maths stream students. Practice past papers with instant AI explanations in Sinhala and English.",
  keywords: [
    "A/L",
    "Advanced Level",
    "Sri Lanka",
    "Maths",
    "Physics",
    "Chemistry",
    "Past Papers",
    "AI Tutor",
    "Sinhala",
  ],
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={`${inter.variable} font-sans antialiased`}>
        <ThemeProvider
          attribute="class"
          defaultTheme="system"
          enableSystem
          disableTransitionOnChange
        >
          {children}
          <Toaster />
        </ThemeProvider>
      </body>
    </html>
  );
}
