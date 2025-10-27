// app/api/weather/route.ts
import { NextResponse } from "next/server";

export async function GET(req: Request) {
  const data = { temp: 18, city: "Copenhagen" };
  return NextResponse.json(data);
}
