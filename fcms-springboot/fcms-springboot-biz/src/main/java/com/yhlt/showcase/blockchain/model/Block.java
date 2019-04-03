package com.yhlt.showcase.blockchain.model;

import java.util.ArrayList;
import java.util.List;

/**
 * 区块信息
 *
 * @author stone
 * @date 2018年3月6日 下午2:52:23
 */
public class Block {
	String hash;
	String miner;
	long confirmations;
	long size;
	long height;
	long version;
	String merkleroot;
	List<String> tx;
	long time;
	long nonce;
	String bits;
	double difficulty;
	String chainwork;
	String prevblockhash;
	String nextblockhash;

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public String getMiner() {
		return miner;
	}

	public void setMiner(String miner) {
		this.miner = miner;
	}

	public long getConfirmations() {
		return confirmations;
	}

	public void setConfirmations(long confirmations) {
		this.confirmations = confirmations;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public long getHeight() {
		return height;
	}

	public void setHeight(long height) {
		this.height = height;
	}

	public long getVersion() {
		return version;
	}

	public void setVersion(long version) {
		this.version = version;
	}

	public String getMerkleroot() {
		return merkleroot;
	}

	public void setMerkleroot(String merkleroot) {
		this.merkleroot = merkleroot;
	}

	public List<String> getTx() {
		return tx;
	}

	public void setTx(List<String> tx) {
		this.tx = tx;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}

	public long getNonce() {
		return nonce;
	}

	public void setNonce(long nonce) {
		this.nonce = nonce;
	}

	public String getBits() {
		return bits;
	}

	public void setBits(String bits) {
		this.bits = bits;
	}

	public double getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(double difficulty) {
		this.difficulty = difficulty;
	}

	public String getChainwork() {
		return chainwork;
	}

	public void setChainwork(String chainwork) {
		this.chainwork = chainwork;
	}

	public String getPrevblockhash() {
		return prevblockhash;
	}

	public void setPrevblockhash(String prevblockhash) {
		this.prevblockhash = prevblockhash;
	}

	public String getNextblockhash() {
		return nextblockhash;
	}

	public void setNextblockhash(String nextblockhash) {
		this.nextblockhash = nextblockhash;
	}

	public Block() {
		super();
		tx = new ArrayList<String>();
	}

	@Override
	public String toString() {
		return "Block [hash=" + hash + ", miner=" + miner + ", confirmations=" + confirmations + ", size=" + size
				+ ", height=" + height + ", version=" + version + ", merkleroot=" + merkleroot + ", tx=" + tx
				+ ", time=" + time + ", nonce=" + nonce + ", bits=" + bits + ", difficulty=" + difficulty
				+ ", chainwork=" + chainwork + ", prevblockhash=" + prevblockhash + ", nextblockhash=" + nextblockhash
				+ "]";
	}

}
