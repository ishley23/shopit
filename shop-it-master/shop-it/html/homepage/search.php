<?php
  session_start();
  $con = mysqli_connect("localhost","root","","ishley_db");
  $flag = isset($_SESSION["Username"]);
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://fonts.googleapis.com/css?family=Baloo+Chettan+2&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="../../core/sass/main.css" />
    <title>
      <?php
        if($flag){
          $Username = $_SESSION["Username"];
          echo 'Welcome '. strtoupper($Username). "!";
        }
        else{
          echo 'Stylesworth';
        } 
      ?>
    </title>
  </head>
  <body>
    <div class="nav">
      <ul>
        <li class="nav__item font-8 font-large">
          <a href="./index.php">
            Stylesworth
          </a>
        </li>
        <li class="nav__item">
          <div class="search" id="search">
            <form action="search.php" method="post">
            <input class="search__item" type="text" name="search" placeholder="Search" />
            <button type="submit"><i class="fa fa-search search__item"></i></button>
            </form>
          </div>
        </li>
        <li class="nav__item font-8" style="display: flex;">
          <ul
            class="user-selection slide-left"
            id="user-links"
            style="display: none; margin-right: -70px;"
          >
            <li class="selection__container">
              <a class="selection__item">User</a>
            </li>
            <li class="selection__container">
              <a
                href="../login-and-sign-up/log-in-and-sign-up.php"
                class="selection__item"
                >Login</a
              >
            </li>
            <li class="selection__container">
              <a
                href="../login-and-sign-up/log-in-and-sign-up.php"
                class="selection__item"
                >Sign up
              </a>
            </li>
            <?php
              if($flag){
                echo '<li class="selection__container">
                        <a class="selection__item" href="logout.php" name="logout">
                          Log out
                        </a>
                      </li>
                      <li class="selection__container">
                        <a class="selection__item" href="sell.php">
                          SELL
                        </a>
                      </li>
                      <li class="selection__container">
                        <a class="selection__item" href="cart.php">
                          <i class="fa fa-shopping-cart"></i>
                        </a>
                      </li>
                      ';
              }
            ?>

          </ul>

          <button class="btn-user" onclick="ToggleSlide()">
            <img class="img" src="../../core/images/user.png" alt="User" />
          </button>
        </li>
      </ul>
    </div>
    </div>

    <div class="titles">
      Products
    </div>
    <div class="gallery">
      <ul class="gallery-items">

        <?php
          $search = $_POST['search'];
          if($search!=""){
          $sql = "select ProductName, Price, Image,Description from Product where ProductName LIKE '%$search%' ";
          $result = mysqli_query($con, $sql) or die($con->error);
          
          while($result_row = $result->fetch_assoc()){
            echo '<li class="gallery__item">
                <div class="card">
                <div class="card__image">
                <img
                src="../../core/images/' . $result_row['Image'] . 
                '"alt="product-image"
                class="product-image"
                />' . '</div>
                <div class="card__description">' . $result_row['Description'] .
                '</div>
                <div class="card__product-name">
                  '. $result_row['ProductName'] . '<br />
                  <span class="clr-black"> $' . $result_row['Price'] .
                '</span>
                </div>
                <div class="card__button">
                  <button class="btn-buy" onclick="ToggleModal()">
                    BUY NOW
                  </button>
                </div>
              </div>
            </li>';
          }
        }
        ?>
        
      </ul>
    </div>
    <div class="modal" id="modal">
      <span class="close" onclick="Close()" id="close">&times;</span>
      <div class="modal__top">
        <img
          src="../../core/images/dress.png"
          alt="product-image"
          class="product-image--bigger"
        />
      </div>

      <div class="card__product-name--bigger">
        Designer<br />
        <span>
          P500
        </span>
      </div>
      <div class="card__description--bigger">
        Lorem ipsum cannot help me in this stupid world of great trouble that im
        having today.
      </div>
      <button class="btn-modal" onclick="Snack()">
        BUY
      </button>
    </div>
    <div id="snackbar">
      <div id="snackbar__content">
        Purchase Complete
      </div>
    </div>
    <footer>
      Made by Rey Joshua H. Macarat and Jonathan Jubeth Ollave <br />
      © 2020 F1. All Rights Reserved.
    </footer>
  </body>
  <script src="../../core/js/main.js"></script>
</html>