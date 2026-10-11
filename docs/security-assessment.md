# OpenSSF Scorecard hardening

Scorecard measures repository practices as well as source code. Its public
[report](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)
is a periodically refreshed snapshot, not an assurance that every integration
has been tested. The October 8, 2026 baseline scored 6.9/10.

## Engineering controls

* Pull requests run validation on macOS 15 and 26, real hosted macOS desktop
  E2E, Python CodeQL with extended security queries, and native parser fuzzing.
  AppleScript compilation and ShellCheck complement CodeQL, which does not
  analyze AppleScript.
* Atheris mutates synthetic inputs passed to the compiled production parser.
  The harness checks record invariants and exact results for a structured
  subset, accepts only documented date/time validation errors, and fails on
  unexpected errors or timeouts. It never invokes record creation. Coverage
  guidance comes from the Python oracle; AppleScript bytecode is not instrumented.
  PR smoke runs are bounded to 128 inputs/180 seconds; scheduled runs allow
  2,048 inputs/600 seconds. Logs and failure inputs are retained for 14 days.
* Dependency updates cover the actual GitHub Actions and fuzzing requirements.
  Dependabot auto-merge requires successful validation, desktop E2E, CodeQL,
  and fuzzing. Skipped checks cannot satisfy those requirements.
* Release builds run validation and desktop E2E before packaging current
  Automator sources, the newly compiled library, and the Alfred workflow.
  Stable version tags must be ancestors of `main`. GitHub provenance binds
  package digests to `release.yml`; both artifacts are verified before a
  draft release is created. Publishing the draft is a maintainer action.
* Workflow permissions are scoped by job. Actions are pinned to commits;
  checkout does not retain credentials. Signing uses GitHub OIDC for new
  build provenance, without a stored signing-key secret.

## Release verification

Future attested packages can be verified with a recent GitHub CLI:

```bash
gh attestation verify MacGTD.alfredworkflow \
  --repo somethingwithproof/MacGTD \
  --signer-workflow somethingwithproof/MacGTD/.github/workflows/release.yml
gh attestation verify MacGTD.zip \
  --repo somethingwithproof/MacGTD \
  --signer-workflow somethingwithproof/MacGTD/.github/workflows/release.yml
shasum -a 256 -c SHA256SUMS
```

The unchanged v1.0.0 and v2.0.0 downloads receive detached OpenPGP signatures
in October 2026. These endorse the downloaded bytes at signing time; they do
not establish historical build provenance. Download the matching
`MacGTD.alfredworkflow.asc` from the same release and verify it:

```bash
gpg --import docs/release-signing-key.asc
gpg --fingerprint 1E7614455677C3210AD09726DDE49EA87D9A4F77
gpg --verify MacGTD.alfredworkflow.asc MacGTD.alfredworkflow
```

Expected maintainer fingerprint:
`1E76 1445 5677 C321 0AD0 9726 DDE4 9EA8 7D9A 4F77`.
Verify the fingerprint through a trusted maintainer channel rather than trusting
a key solely because it accompanies a download. A matching checksum detects
corruption; it does not authenticate a publisher on its own.

## Findings that require people or time

There is currently one repository maintainer. An independent reviewer must be
identified before required approvals or CODEOWNERS review can be enforced
without blocking every maintainer-authored PR. Historical Code-Review and
CI-Tests scores improve as genuinely reviewed and tested changes enter the
lookback window; old approvals must not be manufactured.

The OpenSSF Best Practices badge requires project enrollment and truthful
self-assessment by an authorized owner. This repository does not claim the
badge. Evidence available here includes LICENSE, CONTRIBUTING.md, SECURITY.md,
CHANGELOG.md, automated validation, security scanning, fuzzing, and release
verification. An enrollment must still evaluate every applicable criterion.

Contributor diversity and activity scores reflect real participation. They
cannot be corrected by artificial commits, issues, or author identities.
The public Scorecard report may lag newly applied controls. Packaging recognition
also depends on which publishing mechanisms Scorecard supports; the tested
release workflow is the authoritative implementation evidence.

Live vendor accounts and licensed desktop apps remain separate from default
CI. See [coverage and prerequisites](../tests/e2e/README.md).
