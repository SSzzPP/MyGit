(function($, owner) {
	var NfcAdapter;
	var NdefRecord;
	var NdefMessage;
	
	var waiting ;
	var readyWriteData = false;
	var readyRead = false;
	
	owner.listenNFCStatus = function () {
	    try{
	        var main = plus.android.runtimeMainActivity();
	        var Intent = plus.android.importClass('android.content.Intent');
		    var Activity = plus.android.importClass('android.app.Activity');
		    var PendingIntent = plus.android.importClass('android.app.PendingIntent');
		    var IntentFilter = plus.android.importClass('android.content.IntentFilter');
		    NfcAdapter = plus.android.importClass('android.nfc.NfcAdapter');
		    var nfcAdapter = NfcAdapter.getDefaultAdapter(main);
		    var intent = new Intent(main, main.getClass());
		    intent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
		    var pendingIntent = PendingIntent.getActivity(main, 0, intent, 0);
		    var ndef = new IntentFilter("android.nfc.action.TECH_DISCOVERED");
		    ndef.addDataType("*/*");
		    var intentFiltersArray = [ndef];
		    var techListsArray = [
		        ["android.nfc.tech.IsoDep"],
		        ["android.nfc.tech.NfcA"],
		        ["android.nfc.tech.NfcB"],
		        ["android.nfc.tech.NfcF"],
		        ["android.nfc.tech.Nfcf"],
		        ["android.nfc.tech.NfcV"],
		        ["android.nfc.tech.NdefFormatable"],
		        ["android.nfc.tech.MifareClassi"],
		        ["android.nfc.tech.MifareUltralight"]
		    ];
		    /*document.addEventListener("newintent",function() {
	            console.error('newintent');
	            setTimeout(owner.handleNfcData1, 1000);
	        }, false);*/
		    document.addEventListener("pause", function(e) {
		        if (nfcAdapter) {
		            nfcAdapter.disableForegroundDispatch(main);
		            console.log('pause');
		        }
		    }, false);
		    document.addEventListener("resume", function(e) {
	        if (nfcAdapter) {
	            console.log('resume');
	                nfcAdapter.enableForegroundDispatch(main, pendingIntent, intentFiltersArray, techListsArray);
	            }
	        }, false);
	        nfcAdapter.enableForegroundDispatch(main, pendingIntent, intentFiltersArray, techListsArray);
	    }catch(e){
	        console.error(e);
	    }
	}
	
	owner.handleNfcData1 = function(){
	    NdefRecord = plus.android.importClass("android.nfc.NdefRecord");
		NdefMessage = plus.android.importClass("android.nfc.NdefMessage");
		var main = plus.android.runtimeMainActivity();
		var intent = main.getIntent();
		console.log("action type:" + intent.getAction());
		if("android.nfc.action.TECH_DISCOVERED" == intent.getAction()){
	        if(readyRead){
	            owner.__read(intent);
	            readyRead = false;
	        }
	    }
	}
	
	owner.showToast = function(msg){
	    plus.nativeUI.toast(msg);
	}
		
	owner.__read = function(intent){
	    /*waiting.setTitle('请勿移开标签\n正在读取数据...');
		var Parcelable = plus.android.importClass("android.os.Parcelable");
		var rawmsgs = intent.getParcelableArrayExtra("android.nfc.extra.NDEF_MESSAGES");
		var result = "啥都没有,";
		mui.each(rawmsgs,function(records){
			mui.each(records.getRecords(),function(data){
				var temp = data.getPayload();
				if(temp!=null){
					result += temp+",";
				}
			});
		});
		//records = rawmsgs[0].getRecords();
		//var result = records[0].getPayload();
		var s = plus.android.newObject("java.lang.String",result);
		owner.showToast(s);
	    waiting.close();*/
	   	waiting.setTitle('请勿移开标签\n正在读取数据...');
	    var Parcelable = plus.android.importClass("android.os.Parcelable");
	    var rawmsgs = intent.getParcelableArrayExtra("android.nfc.extra.NDEF_MESSAGES");
	    records = rawmsgs[0].getRecords();
	    var result = records[0].getPayload();
	    var s = plus.android.newObject("java.lang.String",result);
	    document.getElementById('content').textContent = s;
	    waiting.close();
	}
	document.addEventListener('plusready',owner.listenNFCStatus,false);
	
	owner.readData = function(){
	    readyRead = true;
	    waiting = plus.nativeUI.showWaiting("请将NFC标签靠近！");
	   
	}
}(mui,window.topNfcUtil = {}));