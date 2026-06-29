# Como subir a Sessão Zero (só pelo navegador)

Você **não precisa de terminal nem instalar nada**. O Vite roda sozinho no Vercel.
Você só coloca estes arquivos no GitHub e conecta no Vercel — igual ao Convocação.

---

## Parte 1 — Descompactar

1. Baixe o arquivo `sessao-zero.zip`.
2. Clique com o botão direito → **Extrair tudo** (Windows) ou clique duas vezes (Mac).
3. Vai aparecer uma pasta `sessao-zero` com os arquivos dentro. Guarde-a num lugar fácil.

---

## Parte 2 — Supabase (o banco)

1. Entre em https://supabase.com e crie um projeto novo (ou use o mesmo do Convocação).
2. No menu lateral, clique em **SQL Editor** → **New query**.
3. Abra o arquivo `schema.sql` (está na pasta) num bloco de notas, copie tudo, cole ali e clique em **RUN**.
4. No menu, vá em **Project Settings** (engrenagem) → **API**. Deixe esta aba aberta — você vai copiar dois valores no Vercel:
   - **Project URL**
   - **anon public** (a chave longa)

---

## Parte 3 — GitHub (guardar o código)

1. Entre em https://github.com → botão **New** (ou **+** no topo → New repository).
2. Dê um nome (ex.: `sessao-zero`), deixe **Public** ou **Private**, e clique em **Create repository**.
3. Na página do repositório vazio, clique no link **"uploading an existing file"** (ou aba **Add file → Upload files**).
4. Abra a pasta `sessao-zero` que você extraiu, selecione **todos os arquivos e a pasta `src`**, e **arraste** para a área de upload do GitHub.
   - Confira que apareceu a pasta `src` com `SessaoZero.jsx`, `main.jsx`, `store.js` e `supabase.js` dentro.
   - O `SessaoZero.jsx` é grande (~500 KB por causa das imagens) — espere ele terminar de subir.
5. Lá embaixo, clique em **Commit changes**.

> Se o arraste não levar a pasta `src`, use **Add file → Create new file**, digite `src/SessaoZero.jsx` no nome (a barra cria a pasta) e cole o conteúdo. Repita para os outros de `src`.

---

## Parte 4 — Vercel (publicar)

1. Entre em https://vercel.com → **Add New** → **Project**.
2. Importe o repositório `sessao-zero` do seu GitHub.
3. O Vercel detecta **Vite** sozinho — não mexa nas configurações de build.
4. Abra a seção **Environment Variables** e adicione **duas** variáveis (use os valores da aba do Supabase que ficou aberta):

   | Name | Value |
   |------|-------|
   | `VITE_SUPABASE_URL` | sua Project URL |
   | `VITE_SUPABASE_ANON_KEY` | sua chave anon public |

   > Atenção: é a seção **"Environment Variables"** (variáveis), não "Environments". Foi o detalhe que te pegou no Convocação.

5. Clique em **Deploy** e aguarde (1–2 min).
6. Quando terminar, o Vercel te dá o link do site. Pronto, está no ar.

---

## Parte 5 — Testar

1. Abra o link → **Sou o Mestre** → **Criar conclave** → anote o código.
2. Abra o mesmo link numa aba anônima → **Sou Jogador** → digite o código → responda.
3. Volte ao painel do mestre → **Atualizar** → o perfil aparece.

A partir daqui, qualquer mudança que você (ou eu, gerando arquivos) subir no GitHub republica o site sozinho.

---

## Observações

- A senha do mestre é simples e o banco é aberto pela chave anon — é o suficiente pra um RPG no começo. Dá pra reforçar depois.
- O botão **"Conclave de exemplo"** cria um conclave `DEMO` no banco de verdade. Use pra testar; remova depois se quiser.
