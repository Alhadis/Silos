include_files = {'**/*.lua.txt', '**/*.lua'}
exclude_files = {'Assets/ThirdLib/', 'Assets/Generated/', '**/luaunit.lua'}
codes = true

local rewritable = {read_only = false, other_fields = true}
stds.my_lib = {
  read_globals = {
    CS = {
      other_fields = true,
      fields = {
        UnityEngine = {
          other_fields = true,
          --reimplemented unity struct in pure lua.
          fields = {
            Bounds = rewritable,
            Color = rewritable,
            LayerMask = rewritable,
            Mathf = rewritable,
            Plane = rewritable,
            Quaternion = rewritable,
            Ray = rewritable,
            RaycastHit = rewritable,
            Time = rewritable,
            AudioListener = rewritable,
            TouchPhase = rewritable,
            Touch = rewritable,
            Vector2 = rewritable,
            Vector3 = rewritable,
            Vector4 = rewritable,
            EditorApplication = rewritable,
            Application = rewritable
          }
        },
        -- CS.Pap namespace.
        Pap = {other_fields = true},
        -- Dotween
        DG = rewritable,
        --fingers plugin.
        DigitalRubyShared = {other_fields = true},
        GraphQL = {other_fields = true},
        --promise
        RSG = {other_fields = true},
        UniWebView = {other_fields = true},
        SafeAreaUtility = {other_fields = true}
      },
    }
  },

  globals = {
    '__G__ERROR_TRACE',
  }
}

--lua51c+lua52c+lua53c+luajit
std = 'max+my_lib'

read_globals = {
  --xlua global.
  'typeof',
  'uint64',
  'cast',
  'xlua',
  --other
}

new_globals = {
  --extend lua libraries
  'coroutine',
  'math',
  'table',
  'string',
  'print',
  'handler',
  'import',
  'reimport',
  'class',
  'io.stdout',
  'os.exit'
}

ignore = {
   --allow only space line.
  '611',
   --unused argument, like self.
  '212',
}

--max_line_length = 140
--max_comment_line_length = 160
