/**
 * @function initiateRegistration
 * @param challenge - the challenge string
 * @param userId - the userId string
 * @param options - optional parameters, for example:
 *   {
 *     rp: {
 *       id: string,
 *       name: string,
 *     }
 *     user: {
 *       name: string
 *       displayName: string
 *     },
 *     pubKeyCredParams: [
 *       {alg: -7, type: 'public-key'}
 *     ],
 *     authenticatorSelection: {
 *       authenticatorAttachment: 'cross-platform'
 *     },
 *     timeout: 60000,
 *     attestation: 'direct'
 *   }
 *
 * @returns {Promise<PublicKeyCredential>}
 */
async function initiateRegistration(challenge, userId, options) {
  if (!challenge || !userId) {
    throw new Error('Challenge and userId must be defined')
  }

  if (!options) {
    options = {}
  }

  const credentialCreationOptions = {
    // challenge: str2ab(challenge),
    challenge: Uint8Array.from(challenge, c => c.charCodeAt(0)),
    rp: options.rp || {
      id: 'pineapplepay.moja-lab.live',
      name: 'Pineapple Pay'
    },
    user: {
      id: str2ab(userId),
      name: options.user && options.user.name || 'test@example.com',
      displayName: options.user && options.user.displayName || 'Example User',
    },
    pubKeyCredParams: options.pubKeyCredParams || [
      { alg: -7, type: 'public-key' }
    ],
    timeout: options.timeout || 60000,
    attestation: options.attestation || 'direct'
  }

  // add other values that default to empty:
  if (options.authenticatorSelection) {
    credentialCreationOptions.authenticatorSelection = options.authenticatorSelection
  }

  console.log(`calling window.navigator.credentials.create with options:\n ${JSON.stringify(credentialCreationOptions)}`)

  const credential = await window.navigator.credentials.create(
    {publicKey: credentialCreationOptions}
  )

  // convert from ArrayBuffers here since Dart's JS interop has problems with
  // marshalling a NativeByteBuffer
  const rawId = new Uint8Array(credential.rawId)
  const attestationObject = new Uint8Array(credential.response.attestationObject)
  const clientDataJSON = new Uint8Array(credential.response.clientDataJSON)

  return null;
}