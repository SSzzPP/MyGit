package com.yhlt.showcase.blockchain.command;
/**
 *
 * @author stone
 * @date 2018年3月29日 上午11:16:29
 */
public class Chain {
	private AddressCommand addressCommand;
	private AssetCommand assetCommand;
	private BlockCommand blockCommand;
	private DataModCommand dataModCommand;
	private FeeCommand feeCommand;
	private KeyCommand keyCommand;
	private MessageCommand messageCommand;
	private OutChainCommand outChainCommand;
	private RawDealCommand rawDealCommand;
	private SellCommand sellCommand;
	private SendCommand sendCommand;
	private TransactionCommand transactionCommand;
	private WalletCommand walletCommand;
	/**
	 *
	 * @param ip
	 * @param port
	 * @param login     rpcuser(yqemu.conf文件中查找)
	 * @param password  rpcpassword(yqemu.conf文件中查找)
	 */
	public Chain(String ip, String port, String login, String password){
		addressCommand=new AddressCommand(ip, port, login, password);
		assetCommand=new AssetCommand(ip, port, login, password);
		blockCommand=new BlockCommand(ip, port, login, password);
		dataModCommand=new DataModCommand(ip, port, login, password);
		feeCommand=new FeeCommand(ip, port, login, password);
		keyCommand=new KeyCommand(ip, port, login, password);
		messageCommand=new MessageCommand(ip, port, login, password);
		outChainCommand=new OutChainCommand(ip, port, login, password);
		rawDealCommand=new RawDealCommand(ip, port, login, password);
		sellCommand=new SellCommand(ip, port, login, password);
		sendCommand=new SendCommand(ip, port, login, password);
		transactionCommand=new TransactionCommand(ip, port, login, password);
		walletCommand=new WalletCommand(ip, port, login, password);
	}

	public AddressCommand getAddressCommand() {
		return addressCommand;
	}

	public void setAddressCommand(AddressCommand addressCommand) {
		this.addressCommand = addressCommand;
	}

	public AssetCommand getAssetCommand() {
		return assetCommand;
	}

	public void setAssetCommand(AssetCommand assetCommand) {
		this.assetCommand = assetCommand;
	}

	public BlockCommand getBlockCommand() {
		return blockCommand;
	}

	public void setBlockCommand(BlockCommand blockCommand) {
		this.blockCommand = blockCommand;
	}

	public DataModCommand getDataModCommand() {
		return dataModCommand;
	}

	public void setDataModCommand(DataModCommand dataModCommand) {
		this.dataModCommand = dataModCommand;
	}

	public FeeCommand getFeeCommand() {
		return feeCommand;
	}

	public void setFeeCommand(FeeCommand feeCommand) {
		this.feeCommand = feeCommand;
	}

	public KeyCommand getKeyCommand() {
		return keyCommand;
	}

	public void setKeyCommand(KeyCommand keyCommand) {
		this.keyCommand = keyCommand;
	}

	public MessageCommand getMessageCommand() {
		return messageCommand;
	}

	public void setMessageCommand(MessageCommand messageCommand) {
		this.messageCommand = messageCommand;
	}

	public OutChainCommand getOutChainCommand() {
		return outChainCommand;
	}

	public void setOutChainCommand(OutChainCommand outChainCommand) {
		this.outChainCommand = outChainCommand;
	}

	public RawDealCommand getRawDealCommand() {
		return rawDealCommand;
	}

	public void setRawDealCommand(RawDealCommand rawDealCommand) {
		this.rawDealCommand = rawDealCommand;
	}

	public SellCommand getSellCommand() {
		return sellCommand;
	}

	public void setSellCommand(SellCommand sellCommand) {
		this.sellCommand = sellCommand;
	}
	
	public SendCommand getSendCommand() {
		return sendCommand;
	}
	
	public void setSendCommand(SendCommand sendCommand) {
		this.sendCommand = sendCommand;
	}

	public TransactionCommand getTransactionCommand() {
		return transactionCommand;
	}

	public void setTransactionCommand(TransactionCommand transactionCommand) {
		this.transactionCommand = transactionCommand;
	}

	public WalletCommand getWalletCommand() {
		return walletCommand;
	}

	public void setWalletCommand(WalletCommand walletCommand) {
		this.walletCommand = walletCommand;
	}

}
