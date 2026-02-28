"use client";

import { useState, useRef, useEffect } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { MathText } from "@/components/questions/math-renderer";
import { supabase } from "@/lib/supabase";
import { useToast } from "@/hooks/use-toast";
import {
  MessageSquare,
  Send,
  Loader2,
  Bot,
  User,
  Sparkles,
  Lightbulb,
} from "lucide-react";
import type { LanguagePreference } from "@/types";

interface Message {
  id: string;
  role: "user" | "assistant";
  content: string;
  timestamp: Date;
}

const suggestedQuestions = [
  "Explain mathematical induction with an example",
  "What is the difference between definite and indefinite integrals?",
  "How do I solve problems involving complex numbers in the Argand plane?",
  "Explain Newton's laws of motion with examples",
  "What are the steps to balance a redox equation?",
];

export default function ChatPage() {
  const [messages, setMessages] = useState<Message[]>([]);
  const [input, setInput] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [userLanguage, setUserLanguage] = useState<LanguagePreference>("english");
  const messagesEndRef = useRef<HTMLDivElement>(null);
  const { toast } = useToast();

  // Load user preferences
  useEffect(() => {
    async function loadPreferences() {
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (user) {
        const { data: profile } = await supabase
          .from("profiles")
          .select("language_preference")
          .eq("id", user.id)
          .single();
        if (profile) {
          setUserLanguage(profile.language_preference);
        }
      }
    }
    loadPreferences();
  }, []);

  // Scroll to bottom on new messages
  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages]);

  const handleSend = async (messageText?: string) => {
    const text = messageText || input.trim();
    if (!text || isLoading) return;

    const userMessage: Message = {
      id: Date.now().toString(),
      role: "user",
      content: text,
      timestamp: new Date(),
    };

    setMessages((prev) => [...prev, userMessage]);
    setInput("");
    setIsLoading(true);

    try {
      const response = await fetch("/api/chat/ask", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          message: text,
          language: userLanguage,
          history: messages.slice(-6).map((m) => ({
            role: m.role,
            content: m.content,
          })),
        }),
      });

      if (!response.ok) {
        throw new Error("Failed to get response");
      }

      const data = await response.json();

      const assistantMessage: Message = {
        id: (Date.now() + 1).toString(),
        role: "assistant",
        content: data.response,
        timestamp: new Date(),
      };

      setMessages((prev) => [...prev, assistantMessage]);
    } catch (error) {
      console.error("Chat error:", error);
      toast({
        title: "Error",
        description: "Failed to get a response. Please try again.",
        variant: "destructive",
      });
    } finally {
      setIsLoading(false);
    }
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      handleSend();
    }
  };

  return (
    <div className="flex flex-col h-[calc(100vh-8rem)] page-transition">
      {/* Header */}
      <div className="mb-4">
        <h1 className="text-3xl font-bold mb-2 flex items-center gap-3">
          <MessageSquare className="h-8 w-8 text-primary" />
          Ask AI Tutor
        </h1>
        <p className="text-muted-foreground">
          Get instant help with any A/L question in{" "}
          {userLanguage === "sinhala"
            ? "Sinhala"
            : userLanguage === "both"
            ? "Sinhala & English"
            : "English"}
        </p>
      </div>

      {/* Messages */}
      <Card className="flex-1 overflow-hidden">
        <CardContent className="p-4 h-full overflow-y-auto">
          {messages.length === 0 ? (
            <div className="h-full flex flex-col items-center justify-center text-center">
              <Bot className="h-16 w-16 text-muted-foreground/50 mb-4" />
              <h2 className="text-xl font-semibold mb-2">
                How can I help you today?
              </h2>
              <p className="text-muted-foreground mb-6 max-w-md">
                Ask me anything about Combined Maths, Physics, or Chemistry. I
                can explain concepts, solve problems, and give exam tips.
              </p>

              {/* Suggested Questions */}
              <div className="space-y-2 max-w-lg">
                <div className="flex items-center gap-2 text-sm text-muted-foreground mb-2">
                  <Lightbulb className="h-4 w-4" />
                  Try asking:
                </div>
                {suggestedQuestions.map((q, i) => (
                  <Button
                    key={i}
                    variant="outline"
                    className="w-full text-left justify-start h-auto py-2 px-3"
                    onClick={() => handleSend(q)}
                  >
                    {q}
                  </Button>
                ))}
              </div>
            </div>
          ) : (
            <div className="space-y-4">
              {messages.map((message) => (
                <div
                  key={message.id}
                  className={`flex gap-3 ${
                    message.role === "assistant" ? "" : "justify-end"
                  }`}
                >
                  {message.role === "assistant" && (
                    <div className="w-8 h-8 rounded-full bg-primary/10 flex items-center justify-center flex-shrink-0">
                      <Bot className="h-4 w-4 text-primary" />
                    </div>
                  )}
                  <div
                    className={`max-w-[80%] rounded-lg p-4 ${
                      message.role === "assistant"
                        ? "bg-muted"
                        : "bg-primary text-primary-foreground"
                    }`}
                  >
                    {message.role === "assistant" ? (
                      <div
                        className={`explanation-content ${
                          userLanguage === "sinhala" ? "sinhala-text" : ""
                        }`}
                      >
                        <MathText text={message.content} />
                      </div>
                    ) : (
                      <p>{message.content}</p>
                    )}
                  </div>
                  {message.role === "user" && (
                    <div className="w-8 h-8 rounded-full bg-primary flex items-center justify-center flex-shrink-0">
                      <User className="h-4 w-4 text-primary-foreground" />
                    </div>
                  )}
                </div>
              ))}

              {isLoading && (
                <div className="flex gap-3">
                  <div className="w-8 h-8 rounded-full bg-primary/10 flex items-center justify-center">
                    <Bot className="h-4 w-4 text-primary" />
                  </div>
                  <div className="bg-muted rounded-lg p-4">
                    <div className="flex items-center gap-2">
                      <Loader2 className="h-4 w-4 animate-spin" />
                      <span className="text-sm text-muted-foreground">
                        Thinking...
                      </span>
                    </div>
                  </div>
                </div>
              )}

              <div ref={messagesEndRef} />
            </div>
          )}
        </CardContent>
      </Card>

      {/* Input */}
      <div className="mt-4 flex gap-2">
        <Textarea
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder={
            userLanguage === "sinhala"
              ? "ඔබගේ ප්‍රශ්නය මෙහි ටයිප් කරන්න..."
              : "Type your question here..."
          }
          className="min-h-[60px] resize-none"
          disabled={isLoading}
        />
        <Button
          onClick={() => handleSend()}
          disabled={!input.trim() || isLoading}
          className="h-auto"
        >
          {isLoading ? (
            <Loader2 className="h-5 w-5 animate-spin" />
          ) : (
            <Send className="h-5 w-5" />
          )}
        </Button>
      </div>
    </div>
  );
}
