# Synapse Container Images<a name="synapse-container-images"></a>

[![Github](https://img.shields.io/badge/repo-github-brightgreen)](https://github.com/homelab-library/synapse/)
[![Build Images](https://github.com/homelab-library/synapse/actions/workflows/image.yml/badge.svg)](https://github.com/homelab-library/synapse/actions/workflows/image.yml)
[![MIT License](https://img.shields.io/badge/license-MIT-blue)](https://raw.githubusercontent.com/homelab-library/synapse/master/LICENSE-MIT)
[![Apache License](https://img.shields.io/badge/license-Apache-blue)](https://raw.githubusercontent.com/homelab-library/synapse/master/LICENSE-APACHE)

<!-- mdformat-toc start --slug=github --maxlevel=6 --minlevel=1 -->

- [Synapse Container Images](#synapse-container-images)
  - [About Synapse](#about-synapse)

<!-- mdformat-toc end -->

This is packaged by homelab-library and is not maintained by the upstream project!

## About Synapse<a name="about-synapse"></a>

[Synapse](https://github.com/matrix-org/synapse)

Synapse is a reference "homeserver" implementation of Matrix from the core development team at matrix.org,
written in Python/Twisted. It is intended to showcase the concept of Matrix and let folks see the spec in
the context of a codebase and let you run your own homeserver and generally help bootstrap the ecosystem.

In Matrix, every user runs one or more Matrix clients, which connect through to a Matrix homeserver.
The homeserver stores all their personal chat history and user account information - much as a mail
client connects through to an IMAP/SMTP server. Just like email, you can either run your own Matrix
homeserver and control and own your own communications and history or use one hosted by someone else
(e.g. matrix.org) - there is no single point of control or mandatory service provider in Matrix,
unlike WhatsApp, Facebook, Hangouts, etc.
