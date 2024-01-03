import { Controller } from "@hotwired/stimulus"
import "ninja-keys"

export default class CommandPaletteController extends Controller {
  static values = {
    commands: Array
  }

  connect() {
    this.close = this.close.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.handleSelected = this.handleSelected.bind(this)
    this.element.data = this.commandsValue.map((cmd) => Object.assign(cmd, {
      handler: !cmd.children && this.handleSelected.bind(this)
    }))
    this.element.addEventListener("change", this.handleChange)
    this.element.addEventListener("selected", this.handleSelected)
  }

  // @param ev Event `{ detail: { search: string } }`
  handleChange(ev) {}

  handleSelected({ frame, href }) {
    if (href) {
      document.removeEventListener("turbo:load", this.close)
      document.removeEventListener("turbo:frame-load", this.close)
      document.addEventListener("turbo:load", this.close, { once: true })
      document.addEventListener("turbo:frame-load", this.close, { once: true })

      Turbo.visit(href, { frame: frame })
    }
  }

  get commands() {
    return this.element.data
  }

  open(opts) {
    this.element.open(opts)
  }

  close() {
    this.element.close()
  }
}
