<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width device-width, initial-scale=1.0">
<?php require('inc/links.php'); ?>
<title><?php echo $settings_r['site_title'] ?> - Facilites </title>


<style>
  .pop:hover{
border-top-color: var(--teal) !important;
transform: scale(1.03);
transition : all 0.3s;
  }
  </style>



</head>
 <body class="bg-light">
  <?php  require('inc/header.php'); ?>
  <div class="my-5 px-4">
    <h2 class="fw-bold h-font text-center"> our facilites</h2>
    <div class="h-line bg-dark"></div>
      <p class="text-center mt-3">
      At StayZone Hotel, we are committed to providing an exceptional array of facilities to enhance your experience. Our spacious and elegantly appointed guest rooms are equipped with modern amenities to ensure your comfort and convenience
</p>

    
  </div>

    <div class="container">
      <div class="row">
    <?php 
      $res = selectAll('facilities');
      $path = FACILITIES_IMG_PATH;
       while($row = mysqli_fetch_assoc($res)){
        echo<<<data
        
          <div class="col-lg-4 col-md-6 mb-5 px-4">
              <div class="bg-white rounded shadow p-4 border-top border-4 border-dark pop">
              <div class="d-flex align-items-center mb-2">
            <img src="$path$row[icon]" width="40px">
          <h5 class="m-0 ms-3">
            $row[name]
          </h5>
          </div>
          <p> $row[description] </p>
          </div>
            </div>
        
        data;
      }
      ?>
 </div>
  </div>
        



      

      

     

      
   

 

      

      
      
      

    
 



<?php require('inc/footer.php');?>
</body>
</html>

    
    



        





