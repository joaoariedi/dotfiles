# AI Development Framework Configuration v2.1

## Claude Code Workflow Requirements (18 Steps - Simplified)

### Phase 1: Planning & Context Setup (Steps 1-4)

#### Step 1: Context Preparation
- Before any implementation, examine the project structure using Glob/Read tools
- Check for existing `README.md`, `package.json`, `pyproject.toml`, or `Cargo.toml` to understand:
  - Tech stack and versions
  - Existing patterns and conventions
  - Available scripts (test, lint, build)
- Look for config files: `.eslintrc`, `pyproject.toml`, `.rustfmt.toml`

#### Step 2: Create Todo List & Plan
- **ALWAYS use TodoWrite tool** to create comprehensive task breakdown
- Include in todos:
  - Objective and scope clarity
  - Step-by-step implementation tasks
  - Quality validation steps
  - Testing requirements
- Use ExitPlanMode tool for complex implementations

#### Step 3: Plan Documentation (Optional for Simple Tasks)
- For complex features (>5 todos), save as `PLAN_<DESCRIPTIVE_NAME>.md`
- Check if `PLAN_*.md` is in `.gitignore`, add if missing
- Include acceptance criteria and test scenarios
- Skip for simple tasks (<3 todos)

#### Step 4: Plan Refinement
- Iterate todos based on user feedback
- Break down large tasks into smaller, manageable pieces
- Clarify ambiguities before implementation

### Phase 2: Implementation with Quality Gates (Steps 5-10)

#### Step 5: Pre-Implementation Setup
- Check for existing quality tools using Grep/Glob:
  - Look for `.pre-commit-config.yaml`
  - Find lint/format scripts in `package.json` or similar
- Identify available commands:
  - Linting: `npm run lint`, `ruff check`, `cargo clippy`
  - Formatting: `npm run format`, `black .`, `cargo fmt`
  - Testing: `npm test`, `pytest`, `cargo test`

#### Step 6: Branch Creation (Git Projects Only)
- If in git repo, create feature branches:
  - Features: `feature/<descriptive-name>`
  - Fixes: `fix/<issue-description>`
  - Use: `git checkout -b feature/task-name`
- Skip for non-git projects

#### Step 7: Incremental Development with TodoWrite
- **Mark todo as "in_progress" before starting work**
- Follow code quality limits:
  - Functions < 50 lines
  - Files < 500 lines
  - Clear, descriptive naming
- **Mark todo as "completed" immediately after finishing**
- Use semantic commit messages when committing:
  - Format: `<type>: <description>`
  - Types: feat, fix, refactor, test, docs

#### Step 8: Documentation During Development
- Add inline documentation for complex functions
- Update README.md only if explicitly requested
- Include `file_path:line_number` references in explanations
- Focus on code clarity over excessive documentation

#### Step 9: Test Creation & Validation
- Write tests when test framework exists:
  - Find existing test patterns using Glob: `**/*test*`, `**/spec/**`
  - Follow existing test structure and naming
  - Focus on business logic and edge cases
- Run test suite if available: `npm test`, `pytest`, `cargo test`

#### Step 10: Quality Checks
- **ALWAYS run quality checks after implementation**:
  - Check available scripts in `package.json`, etc.
  - Run linting: `npm run lint` / `ruff check` / `cargo clippy`
  - Run type checking: `npm run typecheck` / `mypy` / `cargo check`
  - Run tests if they exist
- Fix any issues before considering task complete

### Phase 3: Review & Integration (Steps 11-16) - Simplified

#### Step 11: Local Validation
- Ensure all todos are completed
- Run full test suite if available
- Verify no regressions in existing functionality
- Check that all quality tools pass

#### Step 12: Git Integration (If Applicable)
- Stage relevant changes: `git add .`
- Create semantic commit with co-author option:
  - Ask user about co-authoring preference
  - Use format: `type: description\n\n🤖 Generated with Claude Code\n\nCo-Authored-By: Claude <noreply@anthropic.com>`

#### Step 13: Code Review (Self-Review)
- Review changes for:
  - Security issues (no hardcoded secrets)
  - Performance implications
  - Code maintainability
  - Adherence to existing patterns

#### Step 14: Issue Resolution
- Address any quality check failures
- Fix linting/type errors
- Re-run tests after changes
- Update todos if new issues discovered

#### Step 15: Final Validation
- Verify all acceptance criteria met from todos
- Confirm no breaking changes
- Ensure all quality tools pass
- Check that implementation matches user requirements

#### Step 16: Completion
- Mark all todos as completed
- Only commit when user explicitly requests it
- Provide summary of changes made

### Phase 4: Post-Implementation (Steps 17-18) - Optional

#### Step 17: Metrics Collection (Optional)
- Note any lessons learned for future tasks
- Record which quality tools were most helpful
- Document any patterns discovered

#### Step 18: Retrospective (Optional)
- Review what worked well in the implementation
- Identify improvements for future tasks
- Update approach based on project specifics

## Code Quality Standards

### Complexity Limits
- Maximum function length: 50 lines
- Maximum file length: 500 lines  
- Maximum cyclomatic complexity: 10
- Clear, descriptive naming always

### Testing Requirements
- Test existing patterns when framework present
- Focus on business logic and edge cases
- Use existing test structure and conventions
- Aim for reasonable coverage without obsessing over percentages

### Documentation Guidelines
- Inline documentation for complex logic
- README updates only when explicitly requested
- Code should be self-documenting through clear naming
- Include `file_path:line_number` in explanations

### Quality Assurance
- Always run available quality tools before completing
- Fix linting and type errors immediately
- No hardcoded secrets or credentials
- Follow existing project conventions

## Git Configuration

### Commit Message Format
```
<type>: <description>

<body (optional)>

🤖 Generated with Claude Code

Co-Authored-By: Claude <noreply@anthropic.com>
```

### Commit Types
- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Code refactoring
- `test`: Adding tests
- `docs`: Documentation updates
- `style`: Code formatting
- `perf`: Performance improvements

### Branch Naming
- Features: `feature/descriptive-name`
- Fixes: `fix/issue-description`
- Refactoring: `refactor/component-name`

## Claude Code Integration

### TodoWrite Usage
- **MANDATORY**: Use TodoWrite for any task with >2 steps
- Mark exactly ONE todo as "in_progress" at a time
- Mark todos "completed" immediately after finishing
- Break down complex tasks into smaller, actionable items

### Quality Command Detection
- Use Glob to find config files: `**/.eslintrc*`, `**/pyproject.toml`, etc.
- Check `package.json` scripts section for available commands
- Look for common patterns: `lint`, `test`, `typecheck`, `format`
- Always ask user for commands if not obvious

### Tool Integration
- Use Read tool to understand existing code patterns
- Use Grep to find similar implementations
- Use Glob to discover project structure
- Use Bash to run quality checks and tests

### Enforcement Triggers
1. **Before any implementation**: Create todos with TodoWrite
2. **During implementation**: Mark progress with TodoWrite
3. **After each file change**: Run relevant quality checks
4. **Before completion**: Ensure all todos marked completed
5. **Git projects**: Ask about co-authoring and only commit when requested

## Project-Specific Adaptations

### JavaScript/TypeScript Projects
- Look for: `package.json`, `.eslintrc*`, `tsconfig.json`
- Common commands: `npm run lint`, `npm run typecheck`, `npm test`
- Check for: Prettier, ESLint, Jest, Vitest

### Python Projects  
- Look for: `pyproject.toml`, `requirements.txt`, `setup.py`
- Common tools: `ruff`, `black`, `mypy`, `pytest`
- Virtual environment detection

### Rust Projects
- Look for: `Cargo.toml`, `Cargo.lock`
- Common commands: `cargo clippy`, `cargo fmt`, `cargo test`
- Check for workspace configuration

### Other Languages
- Examine project files to understand toolchain
- Ask user for specific quality commands if unclear
- Adapt patterns to match existing project structure

# Important Reminders

1. **Always use TodoWrite** for task management and progress tracking
2. **Run quality checks** before considering any task complete
3. **Follow existing patterns** rather than imposing new conventions
4. **Only commit when explicitly requested** by the user
5. **Ask about co-authoring** when creating git commits
6. **Prefer editing existing files** over creating new ones
7. **Keep responses concise** and focused on the task at hand