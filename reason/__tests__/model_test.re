open Jest;

open Expect;

open Notes_utils;

afterEach(() => Model.clearNotes());

test("it should return empty list initially", () => expect(Model.getNotes()) |> toEqual([]));

test(
  "it should add note",
  () =>
    [@ocaml.warning "-10"]
    {
      let newNote = Model.addNote({text: "test"});
      expect(newNote) |> toEqual({text: "test", id: "1"});
    }
);
test(
  "it should get note after adding",
  () =>
    [@ocaml.warning "-10"]
    {
      let _ = Model.addNote({text: "test"})|>ignore;
      expect(Model.getNotes()) |> toEqual([{id: "1", text: "test"}]);
    }
);

test(
  "it should add multiple notes",
  () =>
    [@ocaml.warning "-10"]
    {
      Model.addNote({text: "test1"})|>ignore;
      Model.addNote({text: "test2"})|>ignore;
      Model.addNote({text: "test3"})|>ignore;
      expect(Model.getNotes() |> List.length) |> toEqual(3)|>ignore;
      expect(Model.getNotes())
      |> toEqual([{id: "1", text: "test1"}, {id: "2", text: "test2"}, {id: "3", text: "test3"}]);
    }
);

test(
  "it should get note by id",
  () =>
    [@ocaml.warning "-10"]
    {
      Model.addNote({text: "test1"})|>ignore;
      Model.addNote({text: "test2"})|>ignore;
      Model.addNote({text: "test3"})|>ignore;
      expect(Model.getNoteById("2")) |> toEqual({id: "2", text: "test2"});
    }
);

test(
  "it should update given note",
  () =>
    [@ocaml.warning "-10"]
    {
      Model.addNote({text: "test1"})|>ignore;
      Model.addNote({text: "test2"})|>ignore;
      Model.addNote({text: "test3"})|>ignore;
      Model.updateNote({text: "test changed", id: "2"})|>ignore;
      let updatedNote = Model.getNotes() |> List.find((note) => note.id === "2");
      expect(updatedNote.text) |> toEqual("test changed");
    }
);

test(
  "it should not update anything if wrong id is given",
  () =>
    [@ocaml.warning "-10"]
    {
      Model.addNote({text: "test1"})|>ignore;
      Model.addNote({text: "test2"})|>ignore;
      Model.addNote({text: "test3"})|>ignore;
      Model.updateNote({text: "test changed", id: "LOL WRONG ID"})|>ignore;
      expect(Model.getNotes())
      |> toEqual([{id: "1", text: "test1"}, {id: "2", text: "test2"}, {id: "3", text: "test3"}]);
    }
);

test(
  "it should delete given note",
  () =>
    [@ocaml.warning "-10"]
    {
      Model.addNote({text: "test1"})|>ignore;
      Model.addNote({text: "test2"})|>ignore;
      Model.addNote({text: "test3"})|>ignore;
      Model.deleteNote("2");
      expect(Model.getNotes()) |> toEqual([{id: "1", text: "test1"}, {id: "3", text: "test3"}]);
    }
);

test(
  "it should not delete anything if wrong id is given",
  () =>
    [@ocaml.warning "-10"]
    {
      Model.addNote({text: "test1"})|>ignore;
      Model.addNote({text: "test2"})|>ignore;
      Model.addNote({text: "test3"})|>ignore;
      Model.deleteNote("LOL WRONG ID");
      expect(Model.getNotes())
      |> toEqual([{id: "1", text: "test1"}, {id: "2", text: "test2"}, {id: "3", text: "test3"}]);
    }
);
