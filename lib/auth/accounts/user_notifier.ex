defmodule Auth.Accounts.UserNotifier do
  use Phoenix.Swoosh, view: AuthWeb.EmailView, layout: {AuthWeb.LayoutView, :email}

  @doc """
  Deliver instructions to confirm account.
  """
  def deliver_confirmation_instructions(user, url) do
    new()
    |> to(user.email)
    |> from("noreply@example.com")
    |> subject("Confirmation password")
    |> render_body("confirmation_instructions.html", %{user_email: user.email, url: url})
    |> Auth.Mailer.deliver()
  end

  @doc """
  Deliver instructions to reset a user password.
  """
  def deliver_reset_password_instructions(user, url) do
    new()
    |> to(user.email)
    |> from("noreply@example.com")
    |> subject("Password reset email")
    |> render_body("reset_password_instructions.html", %{user_email: user.email, url: url})
    |> Auth.Mailer.deliver()
  end

  @doc """
  Deliver instructions to update a user email.
  """
  def deliver_update_email_instructions(user, url) do
    new()
    |> to(user.email)
    |> from("noreply@example.com")
    |> subject("Update email instructions")
    |> render_body("update_email_instructions.html", %{user_email: user.email, url: url})
    |> Auth.Mailer.deliver()
  end
end
