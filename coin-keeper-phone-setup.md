# Coin Keeper on your phone (private site list)

Coin Keeper stores only site names and URLs. Supabase sign-in can sync the same private list between your computer and phone. Before sync is configured, the app saves locally on each device; the import/export buttons can move a list manually.

## One-time setup

1. Create a Supabase project in your account.
2. Open the project's SQL Editor and run `coin-keeper-private-sync.sql`.
3. In Project Settings → API Keys, copy the Project URL and **publishable** key.
4. Put those two values in `coin-keeper-config.js` as `supabaseUrl` and `supabasePublishableKey`. Never put a secret or `service_role` key in this file.
5. Publish all the files in this folder to an HTTPS static host, keeping them together. Open `coin-keeper.html` as the app page.
6. In Supabase Auth URL Configuration, add the published app URL to the allowed redirect URLs.
7. In the computer browser, open the local Coin Keeper file and use the up-arrow to export your existing site list. The local file and hosted URL have separate browser storage.
8. Open the published HTTPS app on the computer, use the down-arrow to import that JSON file, then tap the cloud icon and request an email sign-in link. This uploads your list to your account.
9. Open the same HTTPS address on your phone and sign in with the same email. In Safari or Chrome, choose **Add to Home Screen** for an app-like shortcut.

The SQL enables row-level security and limits every read or write to rows owned by the signed-in account. The published app contains only the public publishable key; it does not contain your list or any privileged database key.

## If you prefer no cloud account

Use the up-arrow to export your list on one device, then the down-arrow to import it on another. Each device's changes are otherwise stored separately.

