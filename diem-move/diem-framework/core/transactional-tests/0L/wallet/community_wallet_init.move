///// Setting up the test fixtures for the transactions below. The tags below create validators alice and bob, giving them 1000000 GAS coins.

//! account: dummy, 1000000, 0, validator
//! account: alice, 1000000,


//# run --admin-script --signers DiemRoot Alice
script {
    use DiemFramework::Wallet;
    use Std::Vector;

    fun main(sender: signer) {
      Wallet::set_comm(&sender);
      let list = Wallet::get_comm_list();
      assert!(Vector::length(&list) == 1, 7357001);
    }
}

// check: EXECUTED

//# run --admin-script --signers DiemRoot DiemRoot
script {
    use DiemFramework::Wallet;
    use Std::Vector;

    fun main(vm: signer, _: signer) {
      Wallet::vm_remove_comm(&vm, @Alice);
      let list = Wallet::get_comm_list();
      assert!(Vector::length(&list) == 0, 7357002);
    }
}

// check: EXECUTED