defmodule SreeShasta.AppoinmentController do
  use SreeShasta.Web, :controller

  alias SreeShasta.Appoinment

  def index(conn, _params) do
    appoinments = Repo.all(Appoinment)
    changeset = Appoinment.changeset(%Appoinment{})
    render(conn, "form.html", changeset: changeset,
                            action: appoinment_path(conn, :create))
  end

  def new(conn, _params) do
    changeset = Appoinment.changeset(%Appoinment{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"appoinment" => appoinment_params}) do
    changeset = Appoinment.changeset(%Appoinment{}, appoinment_params)

    case Repo.insert(changeset) do
      {:ok, appoinment} ->
        conn
        |> put_flash(:info, "Appoinment created successfully.")
        |> redirect(to: appoinment_path(conn, :show, appoinment))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    appoinment = Repo.get!(Appoinment, id)
    render(conn, "show.html", appoinment: appoinment)
  end

  def edit(conn, %{"id" => id}) do
    appoinment = Repo.get!(Appoinment, id)
    changeset = Appoinment.changeset(appoinment)
    render(conn, "edit.html", appoinment: appoinment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "appoinment" => appoinment_params}) do
    appoinment = Repo.get!(Appoinment, id)
    changeset = Appoinment.changeset(appoinment, appoinment_params)

    case Repo.update(changeset) do
      {:ok, appoinment} ->
        conn
        |> put_flash(:info, "Appoinment updated successfully.")
        |> redirect(to: appoinment_path(conn, :show, appoinment))
      {:error, changeset} ->
        render(conn, "edit.html", appoinment: appoinment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    appoinment = Repo.get!(Appoinment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(appoinment)

    conn
    |> put_flash(:info, "Appoinment deleted successfully.")
    |> redirect(to: appoinment_path(conn, :index))
  end
end
