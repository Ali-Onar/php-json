<?php include "header.php";

if (isset($_GET['product_id'])) {
    $sql = $db->prepare("SELECT * FROM product WHERE product_id=?");
    $sql->execute([
        $_GET['product_id']
    ]);
    $row = $sql->fetch(PDO::FETCH_ASSOC);
    
}
?>

<div class="album py-5 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <table class="table table-bordered">
                    <thead>
                        <h3><?php echo $row['product_name'] ?></h3>


                    </thead>
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">Rating</th>
                            <th scope="col">Total Comment</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php

                        $sqlq = $db->prepare("SELECT * FROM comment WHERE product_id=?");
                        $sqlq->execute([
                            $_GET['product_id']
                        ]);

                        while ($rowq = $sqlq->fetch(PDO::FETCH_ASSOC)) {
                        ?>
                            <tr>

                                <td><?php echo $rowq['rating']; ?></td>
                                <td><?php echo $rowq['body']; ?></td>

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