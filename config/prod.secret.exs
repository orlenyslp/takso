use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :takso, Takso.Endpoint,
  secret_key_base: "kkUOR+QZNc+cqueJp9uKP/7iJ71RHsxt40aXGRNwclCPUc0Juo2yE+fmCi2R2s5n"

# Configure your database
config :takso, Takso.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "takso_prod",
  pool_size: 15
