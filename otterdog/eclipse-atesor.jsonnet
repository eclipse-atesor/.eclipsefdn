local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('openhw.atesor', 'eclipse-atesor') {
  settings+: {
    description: "",
    members_can_change_project_visibility: false,
    name: "Eclipse Atesor",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('atesor') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Multi-stage Agent for Autonomous RISC-V SW Porting. You can download packages here ↓",
      homepage: "https://akifejaz.github.io/adash",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "agentic-ai",
        "multi-agent-systems",
        "port-sw-to-riscv",
        "porting",
        "risc-v",
        "risc-v-porting"
      ],
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('GOOGLE_API_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('LANGCHAIN_TRACING_V2') {
          value: "********",
        },
        orgs.newRepoSecret('LLM_PROVIDER') {
          value: "********",
        },
        orgs.newRepoSecret('OPENROUTER_API_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('OPENROUTER_FALLBACK_MODELS') {
          value: "********",
        },
      ],
      rulesets: [
        orgs.newRepoRuleset('internal-setting') {
          allows_creations: true,
          enforcement: "disabled",
          required_status_checks: null,
          required_pull_request+: {
            required_approving_review_count: 0,
          },
        },
      ],
      environments: [
        orgs.newEnvironment('copilot') {
        },
      ],
    },
    orgs.newRepo('project-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Project website",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
  ],
} + {
  # snippet added due to 'https://github.com/eclipsefdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}