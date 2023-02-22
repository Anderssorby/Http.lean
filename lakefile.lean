import Lake
open Lake DSL

package Http

@[default_target]
lean_exe http {
  root := `Main
}

@[default_target]
lean_lib Http

require Socket from git
  -- "https://github.com/yatima-inc/Socket.lean" @ "main"
  "https://github.com/anderssorby/Socket.lean" @ "main"

require std from git
  "https://github.com/leanprover/std4" @ "fde95b16907bf38ea3f310af406868fc6bcf48d1"

require Cli from git
  "https://github.com/yatima-inc/Cli.lean" @ "main"

-- require OpenSSL from git
--   "https://github.com/yatima-inc/OpenSSL.lean" @ "7187dab2f60097194167dbfa5afd862c276f4cd7"
