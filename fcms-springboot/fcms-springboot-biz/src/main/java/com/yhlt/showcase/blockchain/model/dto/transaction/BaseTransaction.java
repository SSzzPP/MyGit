package com.yhlt.showcase.blockchain.model.dto.transaction;


/**
 * 交易记录包含的最基础的属性
 * @author stone
 * @date 2018年3月5日 下午4:14:50
 */
public class BaseTransaction {
	private long confirmations;
	private String blockhash;
	private long blockindex;
	private long blocktime;
	private String txid;
	private long time;
	private long timereceived;
	private long version;
	private long locktime;
	public long getConfirmations() {
		return confirmations;
	}
	public void setConfirmations(long confirmations) {
		this.confirmations = confirmations;
	}
	public String getBlockhash() {
		return blockhash;
	}
	public void setBlockhash(String blockhash) {
		this.blockhash = blockhash;
	}
	public long getBlockindex() {
		return blockindex;
	}
	public void setBlockindex(long blockindex) {
		this.blockindex = blockindex;
	}
	public long getBlocktime() {
		return blocktime;
	}
	public void setBlocktime(long blocktime) {
		this.blocktime = blocktime;
	}
	public String getTxid() {
		return txid;
	}
	public void setTxid(String txid) {
		this.txid = txid;
	}
	public long getTime() {
		return time;
	}
	public void setTime(long time) {
		this.time = time;
	}
	public long getTimereceived() {
		return timereceived;
	}
	public void setTimereceived(long timereceived) {
		this.timereceived = timereceived;
	}
	public long getVersion() {
		return version;
	}
	public void setVersion(long version) {
		this.version = version;
	}
	public long getLocktime() {
		return locktime;
	}
	public void setLocktime(long locktime) {
		this.locktime = locktime;
	}
	public BaseTransaction() {
		super();
	}

	/**
	 * @param confirmations
	 * @param blockhash
	 * @param blockindex
	 * @param blocktime
	 * @param txid
	 * @param time
	 * @param timereceived
	 * @param version
	 * @param locktime
	 */
	public BaseTransaction(BaseTransaction baseTransaction) {
		super();
		this.confirmations = baseTransaction.confirmations;
		this.blockhash = baseTransaction.blockhash;
		this.blockindex = baseTransaction.blockindex;
		this.blocktime = baseTransaction.blocktime;
		this.txid = baseTransaction.txid;
		this.time = baseTransaction.time;
		this.timereceived = baseTransaction.timereceived;
		this.version = baseTransaction.version;
		this.locktime = baseTransaction.locktime;
	}

}
