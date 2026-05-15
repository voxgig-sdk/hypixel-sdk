
import { Context } from './Context'


class HypixelError extends Error {

  isHypixelError = true

  sdk = 'Hypixel'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  HypixelError
}

