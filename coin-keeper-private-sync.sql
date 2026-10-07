create table if not exists public.site_links (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  name text not null check (char_length(name) between 1 and 70),
  url text not null,
  updated_at timestamptz not null default now()
);

alter table public.site_links enable row level security;
revoke all on public.site_links from anon;
grant select, insert, update, delete on public.site_links to authenticated;

drop policy if exists "Users can read their own site links" on public.site_links;
drop policy if exists "Users can add their own site links" on public.site_links;
drop policy if exists "Users can update their own site links" on public.site_links;
drop policy if exists "Users can delete their own site links" on public.site_links;

create policy "Users can read their own site links"
  on public.site_links for select to authenticated
  using ((select auth.uid()) = user_id);

create policy "Users can add their own site links"
  on public.site_links for insert to authenticated
  with check ((select auth.uid()) = user_id);

create policy "Users can update their own site links"
  on public.site_links for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

create policy "Users can delete their own site links"
  on public.site_links for delete to authenticated
  using ((select auth.uid()) = user_id);

