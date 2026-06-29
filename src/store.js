// src/store.js
// Mesma interface do protótipo (get / set / list / del), agora sobre o Supabase.
// O app continua guardando STRINGS (JSON.stringify) — por isso a coluna `value` é text.
// O parâmetro `shared` do protótipo é ignorado (no banco tudo vive na mesma tabela).

import { supabase } from "./supabase";

export const store = {
  async set(key, value /*, shared */) {
    const { error } = await supabase
      .from("kv")
      .upsert({ key, value, updated_at: new Date().toISOString() }, { onConflict: "key" });
    if (error) { console.error("store.set", error); return null; }
    return { key, value };
  },

  async get(key /*, shared */) {
    const { data, error } = await supabase
      .from("kv")
      .select("value")
      .eq("key", key)
      .maybeSingle();
    if (error) { console.error("store.get", error); return null; }
    return data ? data.value : null;
  },

  async list(prefix = "" /*, shared */) {
    // escapa os curingas do LIKE (% e _) para tratar o prefixo de forma literal
    const safe = prefix.replace(/([%_\\])/g, "\\$1");
    const { data, error } = await supabase
      .from("kv")
      .select("key")
      .like("key", `${safe}%`);
    if (error) { console.error("store.list", error); return []; }
    return (data || []).map((r) => r.key);
  },

  async del(key /*, shared */) {
    const { error } = await supabase.from("kv").delete().eq("key", key);
    if (error) console.error("store.del", error);
  },
};
