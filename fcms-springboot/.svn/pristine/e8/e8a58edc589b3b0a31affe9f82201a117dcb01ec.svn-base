function createWalletAddress(pubKeyHashVersion,privateKeyVersion,checksumValue,walletPwd,walletName) {
	var address = foo.addressFactory.generateNew(pubKeyHashVersion, checksumValue);
	var wif = address.toWIF(privateKeyVersion, checksumValue);
	var walletData = {"publicAdd":address.address,"privateAdd":wif,"walletPwd":walletPwd,"walletName":walletName}
	return walletData;
}
