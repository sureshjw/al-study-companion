"use client";

import { useEffect, useRef } from "react";
import katex from "katex";
import "katex/dist/katex.min.css";

interface MathRendererProps {
  latex: string;
  displayMode?: boolean;
  className?: string;
}

export function MathRenderer({
  latex,
  displayMode = false,
  className = "",
}: MathRendererProps) {
  const containerRef = useRef<HTMLSpanElement>(null);

  useEffect(() => {
    if (containerRef.current && latex) {
      try {
        katex.render(latex, containerRef.current, {
          displayMode,
          throwOnError: false,
          strict: false,
          trust: true,
        });
      } catch (error) {
        console.error("KaTeX rendering error:", error);
        if (containerRef.current) {
          containerRef.current.textContent = latex;
        }
      }
    }
  }, [latex, displayMode]);

  return <span ref={containerRef} className={className} />;
}

interface MathTextProps {
  text: string;
  className?: string;
}

export function MathText({ text, className = "" }: MathTextProps) {
  const parts = text.split(/(\$\$[\s\S]*?\$\$|\$[^$]*?\$)/);

  return (
    <span className={className}>
      {parts.map((part, index) => {
        if (part.startsWith("$$") && part.endsWith("$$")) {
          // Display math (block)
          const latex = part.slice(2, -2);
          return (
            <span key={index} className="block my-4">
              <MathRenderer latex={latex} displayMode />
            </span>
          );
        } else if (part.startsWith("$") && part.endsWith("$")) {
          // Inline math
          const latex = part.slice(1, -1);
          return <MathRenderer key={index} latex={latex} />;
        } else {
          // Regular text
          return <span key={index}>{part}</span>;
        }
      })}
    </span>
  );
}
