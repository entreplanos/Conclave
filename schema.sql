-- ============================================================
-- Entre Planos · Sessão Zero — schema inicial (Supabase)
-- Cole isto no SQL Editor do Supabase e clique em RUN.
-- ============================================================

-- Tabela chave-valor: o app já fala essa "língua" (cz:meta:..., cz:resp:...)
create table if not exists public.kv (
  key        text primary key,
  value      text,
  updated_at timestamptz not null default now()
);

-- Índice para acelerar as buscas por prefixo (list)
create index if not exists kv_key_prefix_idx on public.kv (key text_pattern_ops);

-- Row Level Security
alter table public.kv enable row level security;

-- LANÇAMENTO RÁPIDO: leitura/escrita pública via chave anon.
-- (mesma exposição do protótipo; endurecer depois com auth/políticas por conclave)
drop policy if exists kv_anon_all on public.kv;
create policy kv_anon_all
  on public.kv
  for all
  to anon
  using (true)
  with check (true);

-- ============================================================
-- EVOLUÇÃO FUTURA (não rode agora) — modelo relacional próprio,
-- quando quiser RLS de verdade e queries por coluna:
--
-- create table conclaves (
--   codigo text primary key,
--   nome text, senha text, criado_em timestamptz default now()
-- );
-- create table respostas (
--   id uuid primary key default gen_random_uuid(),
--   conclave text references conclaves(codigo) on delete cascade,
--   nome text, experiencia text, posicao text,
--   sistemas jsonb, procura jsonb, tipo_campanha text,
--   scores jsonb, dominante text, secundario text,
--   red_flags jsonb, tom jsonb,
--   linhas text, veus text, expectativas text,
--   criado_em timestamptz default now()
-- );
-- ============================================================
