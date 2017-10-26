defmodule Takso.GuardianSerializer do
    @behaviour Guardian.Serializer  
    alias Takso.{Repo,User}
  
    def for_token(%User{} = user), do: { :ok, "User:#{user.id}" }
    def for_token(_), do: { :error, "Unknown resource type" }
  
    def from_token("User:" <> user_id), do: { :ok, Repo.get(User, user_id) }
    def from_token(_), do: { :error, "Unknown resource type" }
    
end