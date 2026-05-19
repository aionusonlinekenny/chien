<?php
$t = time ();
?>
<!DOCTYPE html>
<html>   
<?php 
include 'head.php';
include_once './user/config.php';
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
					 <b>Little Three Kingdoms Backend</b>
				</li>				
			</ul>
      <div class="modal-body">
   <div class="form-horizontal" role="form">
                <div class="form-group">
                    <div class="col-sm-10">
					<h4>Fill Information</h4>
                        <input type="password" id="pwd" name="pwd" class="form-control" maxlength="16" value="" placeholder="Enter Auth Password" required>
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
                <div class="form-group">
					<div class="col-sm-10">	
					<h4>Recharge System</h4>
                       <input type="text" id="chargenum" name="chargenum" class="form-control" min="0" max="9999" value="" placeholder="Amount" required>  		
                    </div><br>
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
                    <div class=" col-sm-10">						
						<button type="submit" class="btn btn-danger btn-block" onclick="chargebtn()">Account Recharge</button>					
                    </div>					
                </div>		
                <div class="form-group">
                    <div class="col-sm-10">
					<h4>Mail System</h4>
                        <select id="mailid" name="mailid" class="selectpicker show-tick form-control" data-live-search="true" data-size="5" title="Select Item">
                        <?php
    $file = fopen("player.txt", "r");
    while(!feof($file))
    {
      $line=fgets($file);
      $txts=explode(';',$line);
      echo '<option value="'.$txts[0].'" title="'.$txts[1].'『'.$txts[2].'』">'.$txts[1].'</option>';
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
                    <div class="col-sm-10">						
						<button type="submit" class="btn btn-primary btn-block" onclick="send_mail()">Send Mail</button>
                    </div>					
                </div>  				
            </div>
      </div>
    </div>
  </div>
     </div>
   </div>
 </div>
 <script src="js/playermsg.js?v=<?php echo $t;?>"></script>
</body>
</html>