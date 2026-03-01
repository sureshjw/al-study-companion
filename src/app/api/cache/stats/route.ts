import { NextResponse } from "next/server";
import { getCacheStats } from "@/lib/cache/explanation-cache";
import { createServerSupabaseClient } from "@/lib/supabase/server";

export const dynamic = "force-dynamic";

/**
 * GET /api/cache/stats
 * Returns cache statistics — total cached explanations and breakdown by language.
 * Only accessible to authenticated users.
 */
export async function GET() {
  try {
    const supabase = await createServerSupabaseClient();
    const {
      data: { user },
    } = await supabase.auth.getUser();

    if (!user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const stats = await getCacheStats();

    return NextResponse.json(stats);
  } catch (error) {
    console.error("Error fetching cache stats:", error);
    return NextResponse.json(
      { error: "Failed to fetch cache statistics" },
      { status: 500 }
    );
  }
}
