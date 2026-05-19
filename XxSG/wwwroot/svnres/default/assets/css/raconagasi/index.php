<?php
$t = time ();
?>
<!DOCTYPE html>
<html>   
<?php 
include_once 'head.php';
include_once './user/config.php';;
?>    
 
<body>
 <div class="container">
   <br>
   <div class="row">
     <div class="container-fluid">
  <div class="modal-dialog">
    <div class="modal-content">
      <ul class="breadcrumb">				
				<li>
					 <b>Little Three Kingdoms</b>
				</li>				
			</ul>
      <div class="modal-body">
   <div class="form-horizontal" role="form">						
                <div class="form-group">
                    <div class="col-sm-10">
					<h4>Fill Information</h4>
                        <input type="password" id="checknum" name="checknum" class="form-control" maxlength="16" value="" placeholder="Enter GM Code: raconagasi" required>
                    </div>
                </div>
				<div class="form-group">
                    <div class="col-sm-10">
                        <select id="qu" name="qu" class="form-control selectpicker" data-size="5" required>
                            <?php
						
						foreach($quarr as $key=>$value){
							if($value['hidde']!=true){
								echo '<option value="'.$key.'">'.$value['name'].'</option>';	
								
						}
						}
							
						?>
                        </select>
                    </div>
                </div>
				<div class="form-group">
                    <div class="col-sm-10">
                        <input type="text" id="uid" name="uid" class="form-control" value="" placeholder="Please enter character name" required>
                    </div>
                </div>
				 <!--div class="form-group">
                    <div class="col-sm-10 ">
						<button type="submit" class="btn btn-danger" onclick="ban()">Ban</button>	
                        <button type="submit" class="btn btn-danger" onclick="unban()">Unban</button>							
                    </div>					
                </div-->
				<div class="form-group">
                    <div class="col-sm-10">
					<h4>Recharge System</h4>
                       <input type="text" id="chargenum" name="chargenum" class="form-control" min="0" max="999999" value="" placeholder="Amount: enter 1-10 only" required>  		
                    </div>
                </div>
               <div class="form-group">
                    <div class="col-sm-10">					
                   	<select id="chargetype" name="chargetype" class="form-control selectpicker" data-size="10" data-live-search="true" required>
<?php
       $file_path = "charge.json";
$str = file_get_contents($file_path);
$data=json_decode($str,true);
foreach($data as $key=>$val){
	echo '<option value="'.$key.'" title="'.$val['name'].'">'.$val['name'].'</option>';
}
			?>
                        </select>				
                    </div>
                </div>				
                <div class="form-group">
                    <div class="col-sm-10 ">
						<button type="submit" class="btn btn-danger btn-block" onclick="chargebtn()">Recharge</button>						
                    </div>					
                </div>
                <div class="form-group">
                    <div class="col-sm-10">	
                     <h4>Mail System</h4>				    
                        <input type="text" id="title" name="title" class="form-control" min="0" max="9999" value="" placeholder="Title" required>
                    </div>
                </div>	
               <div class="form-group">
                    <div class="col-sm-10">					    
                        <input type="text" id="content" name="content" class="form-control" min="0" max="9999" value="" placeholder="Content" required>
                    </div>
                </div>					
                <div class="form-group">
                    <div class="col-sm-10">
                        <select id="mailid" name="mailid" class="selectpicker show-tick form-control" data-live-search="true" data-size="10" title="Please select an item">
                         <?php
    $file = fopen("item.txt", "r");
    while(!feof($file))
    {
      $line=fgets($file);
      $txts=explode(';',$line);
      echo '<option value="'.$txts[0].'" title="'.$txts[1].'">'.$txts[1].'</option>';
    }
    fclose($file);
    ?>							
                        </select>
                    </div>
                </div>
				
				<div class="form-group">
                    <div class="col-sm-10">					    
                        <input type="text" id="mailnum" name="mailnum" class="form-control" min="0" max="9999" value="" placeholder="Amount" required>
                    </div>
                </div>	
                <div class="form-group">
                    <div class="col-sm-10 ">						
					<button type="submit" class="btn btn-primary btn-block" onclick="send_mail()">Send Mail</button>         
					<br>
					<button type="submit" class="btn btn-danger btn-block" onclick="send_allmail()">Send to All Server</button> 
                    </div>					
                </div> 	
				<!--div class="form-group">
                    <div class="col-sm-10">
					<h4>Notice System</h4>			
                        <input type="text" id="noticemsg" name="noticemsg" class="form-control" value="" placeholder="Enter announcement" required>
                    </div>
                </div>
				 <!--div class="form-group">
                    <div class="col-sm-10">						
						<button type="submit" class="btn btn-primary btn-block" onclick="notice()">Post Notice</button>                                            	
                    </div>					
                </div--> 	
				<!--<div class="form-group">
                    <div class="col-sm-10">
					<h4>Server Open Time</h4>			
                        <input type="text" id="opentime" name="opentime" class="form-control" value="" placeholder="Example 2020-06-18 23:00:00" required>
                    </div>
                </div>
				 <div class="form-group">
                    <div class="col-sm-10">						
						<button type="submit" class="btn btn-primary btn-block" onclick="setopentime()">Set Open Time</button>                                            	
                    </div>					
                </div> 	-->
				<!--div class="form-group">
                    <div class="col-sm-10">
					<h4>Auth System</h4>			
                        <input type="text" id="pwd" name="pwd" class="form-control" value="" placeholder="Enter Auth Password" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10">						
						<button type="submit" class="btn btn-primary" onclick="shouquanbtn()">Infinite Gold</button>                                            
                        <button type="submit" class="btn btn-primary" onclick="shouquanbtn1()">Item Backend</button> 		
                    </div>					
                </div> 	
<div class="form-group">
                    <div class="col-sm-10">						
                        <button type="submit" class="btn btn-primary" onclick="unshouquan()">Revoke Auth</button>
						<button type="submit" class="btn btn-primary" onclick="editpwdbtn()">Change Password</button> 			
                    </div>					
                </div-->		
  <br>
 <p class="admin_copyright"> &copy; 2023</p>   
            </div>
			
      </div>
	 
    </div>
	
  </div>
     </div>
   </div>
 </div>
 <script src="js/msg.js?v=<?php echo $t;?>"></script>
</body>
</html>