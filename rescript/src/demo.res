let x = Js.Date.make()

x
|> Js.Date.toISOString
|> ignore /* let data = Dom.Storage.getItem "lol" Dom.Storage.localStorage;

  Js.log (
    switch data {
    | None => "nic nie ma!"
    | Some str => str
    }
  );*/

let data = [1, 2, 3, 4]

data
|> Js.Array.filter(x => mod(x, 2) === 0)
|> Js.Array.map(x => x * x)
|> Js.Array.reduce((x, y) => x + y, 0)
|> Js.log
