
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { HypixelSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await HypixelSDK.test()
    equal(null !== testsdk, true)
  })

})
