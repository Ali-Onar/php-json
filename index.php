<?php include "header.php";


?>

<div class="album py-5 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <table class="table table-bordered">
                    <thead>
                        <h3>Comment List</h3>

                        <div class="form-group">


                            <?php
                            if (isset($_POST['chooseProduct'])) {
                                Header("Location: product-detail.php?product_id=" . $_POST['product_id']);
                            }
                            ?>

                            <form method="POST">
                                <select name="product_id" class="form-control" id="exampleFormControlSelect1">

                                    <?php
                                    $filterProduct = $db->prepare("SELECT * FROM product order by product_id ASC");
                                    $filterProduct->execute();

                                    while ($filterRead = $filterProduct->fetch(PDO::FETCH_ASSOC)) {
                                    ?>
                                        <option <?php
                                                if ($filterRead['product_id'] == $filterRead['product_id']) {
                                                    echo "selected";
                                                }
                                                ?> value="<?php echo $filterRead['product_id'] ?>"><?php echo $filterRead['product_name'] ?>
                                        </option>

                                    <?php } ?>

                                </select>

                                <button class="btn btn-primary" type="submit" name="chooseProduct">Filtrele</button>
                            </form>
                        </div>



                    </thead>
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">Sıra</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">User Mail</th>
                            <th scope="col">Rating</th>
                            <th scope="col">Body</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php

                        $sql = $db->prepare(
                            "SELECT comment.*, orders.*, product.* FROM comment 
                            INNER JOIN orders ON comment.order_id=orders.order_id
                            INNER JOIN product ON comment.product_id=product.product_id"
                        );
                        $sql->execute();


                        $count = 1;
                        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
                        ?>
                            <tr>
                                <th scope="row"> <?php echo $count++ ?></th>
                                <td> <?php echo $row['product_name'] ?></td>
                                <td><?php echo $row['owner_mail'] ?></td>
                                <td><?php echo $row['rating'] ?></td>
                                <td><?php echo $row['body'] ?></td>


                            <?php } ?>

                            </tr>
                    </tbody>
                </table>


            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>

</html>