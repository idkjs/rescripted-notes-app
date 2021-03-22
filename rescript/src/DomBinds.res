module ClassList = {
  type t
  @bs.send external contains: (t, string) => bool = "contains"
  @bs.send external remove: (t, string) => unit = "remove"
  @bs.send external add: (t, string) => unit = "add"
}

module Event = {
  type i<'a> = Dom.event_like<'a>

  @get external target: i<'a> => Dom.element_like<'b> = "target"
}

module Style = {
  type t

  @get external getTop: t => string = "top"
  @set external setTop: (t, string) => unit = "top"
  @set external setLeft: (t, string) => unit = "left"
}

type classList = ClassList.t

type _htmlImageElement
type htmlImageElement = Dom.htmlElement_like<_htmlImageElement>
@set external setSrc: (htmlImageElement, string) => unit = "src"

@set
external setDisabled: (Dom.htmlInputElement, bool) => unit = "disabled"
@get external getValue: Dom.htmlInputElement => string = "value"
@set external setValue: (Dom.htmlInputElement, string) => unit = "value"

@val external document: Dom.document = "document"
@val external window: Dom.window = "window"
@bs.send
external querySelectorAll: (Dom.node_like<'a>, string) => Dom.nodeList = "querySelectorAll"
@bs.send @return(nullable)
external getElementById: (Dom.document, string) => option<Dom.element> = "getElementById"
@get external body: Dom.document => Dom.htmlElement = "body"
@bs.send @return(nullable)
external getElementByIdInput: (Dom.document, string) => option<Dom.htmlInputElement> =
  "getElementById"
@bs.send @return(nullable)
external getElementByIdForm: (Dom.document, string) => option<Dom.htmlFormElement> =
  "getElementById"
@get_index external get: (Dom.nodeList, int) => Dom.element = ""
@get external length: Dom.nodeList => int = "length"
@get
external dataset: Dom.element_like<'a> => Js.Dict.t<string> = "dataset"
@get external classList: Dom.element_like<'a> => classList = "classList"
@get external style: Dom.element_like<'a> => Style.t = "style"
@get
external offsetParent: Dom.element_like<'a> => Dom.element = "offsetParent"
@get external offsetTop: Dom.element_like<'a> => int = "offsetTop"
@get external offsetLeft: Dom.element_like<'a> => int = "offsetLeft"
@get
external nextElementSibling: Dom.element_like<'a> => Js.Nullable.t<Dom.element> =
  "nextElementSibling"
@bs.send @return(nullable)
external querySelector: (Dom.node_like<'a>, string) => option<Dom.element> = "querySelector"
@bs.send @return(nullable)
external querySelectorImage: (Dom.node_like<'a>, string) => option<htmlImageElement> =
  "querySelector"
@bs.send @return(nullable)
external querySelectorInput: (Dom.node_like<'a>, string) => option<Dom.htmlInputElement> =
  "querySelector"
@get external getInnerText: Dom.element => string = "innerText"
@get external getInnerHTML: Dom.element_like<'a> => string = "innerHTML"
@set
external setInnerHTML: (Dom.element_like<'a>, string) => unit = "innerHTML"
@set
external setTextContent: (Dom.element_like<'a>, string) => unit = "textContent"
@get external getContent: Dom.element => string = "content"
@get external getId: Dom.element_like<'a> => string = "id"
@bs.send
external importNode: (Dom.document, string, bool) => Dom.node_like<'a> = "importNode"
@bs.send
external addClickListener: (Dom.eventTarget_like<'a>, @as("click") _, Dom.event => unit) => unit =
  "addEventListener"
@bs.send
external addFocusinListener: (
  Dom.eventTarget_like<'a>,
  @as("focusin") _,
  Dom.event => unit,
) => unit = "addEventListener"
@bs.send
external scrollIntoView: (Dom.element, Js.Dict.t<string>) => unit = "scrollIntoView"
@bs.send
external appendChild: (Dom.element_like<'a>, Dom.node_like<'b>) => unit = "appendChild"
@bs.send @return(nullable)
external closest: (Dom.element_like<'a>, string) => option<Dom.element_like<'b>> = "closest"
@bs.send
external focus: (Dom.element_like<'a>, ~options: {"preventScroll": option<bool>}=?, unit) => unit =
  "focus"
@bs.send external preventDefault: Dom.event => unit = "preventDefault"

type dom_rect = {
  left: float,
  right: float,
  top: float,
  bottom: float,
  x: float,
  y: float,
  width: float,
  height: float,
}

@bs.send
external getBoundingClientRect: Dom.element_like<'a> => dom_rect = "getBoundingClientRect"

@get external getScrollX: Dom.window => float = "scrollX"
@get external getScrollY: Dom.window => float = "scrollY"
@get external getInnerHeight: Dom.window => float = "innerHeight"
