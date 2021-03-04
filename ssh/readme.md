# Notes

- ed25519 is seemingly the fastest and most secure method.
- Prefer ed25519 and only use rsa when absolutely necessary.

---

Generate ed25519 Key: `ssh-keygen -t ed25519 -C "achlfr@dev" -f filename -N ""`
Generate RSA Key: `ssh-keygen -t rsa -b 4096 -C "achlfr@dev" -f filename -N ""`
