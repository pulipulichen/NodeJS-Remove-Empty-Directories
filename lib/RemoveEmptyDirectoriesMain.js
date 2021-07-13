/* global __dirname */

const handleFileFromArgv = require('./cli/handleFileFromArgv.js')

let fs = require('fs')
let path = require('path')

let getDirectories
let trash

let loadPackages = function () {
  getDirectories = require('./fileList/getDirectories.js')
  trash = require('trash')
}

// -------------------------------

module.exports = async function (options = {}) {

  await handleFileFromArgv({
    lockKey: 'remove-empty-directories',
    validateDirectory: true,
    loadPackages
  }, async (file) => {
    let dirList = getDirectories(file)
    
    for (let i = 0; i < dirList.length; i++) {
      let dir = dirList[i]
      // 檢查底下有沒有空值
      if (fs.readdirSync(dir, { withFileTypes: true }).length === 0) {
        await trash(dir)
      }
    }
  })  // await handleFileFromArgv({
}

