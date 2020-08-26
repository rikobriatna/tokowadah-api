<?php

// extends class Model
class MUser extends CI_Model{

  // response jika field ada yang kosong
  public function empty_response(){
    $response['status']=502;
    $response['error']=true;
    $response['message']='Field tidak boleh kosong';
    return $response;
  }

  public function login($email,$password){

    if(empty($email) || empty($password)){
      
	  return $this->empty_response();
	  
    } else{
		
		$response = null;
		$where = array(
			"email"=>$email
		);

		$this->db->where($where);
		$select = $this->db->get("users")->result();
	  
		if(!$select){
		
			$response['status']=501;
			$response['error']=true;
			$response['message']='Login Gagal. User tidak ditemukan';
		
		} else {
			
			$where = array(
				"a.email"=>$email,
				"a.password"=>$password
			);
			
			$this->db->select('*');
			$this->db->from('users a');
			$this->db->join('users_metadata b', 'a.uuid = b.user_id');
			$this->db->where($where);
			$query = $this->db->get();
			
			if($query->result()){
				$response['status']=200;
				$response['error']=false;
				$response['message']='Login sukses';
				$response['user']=$query->result();
			} else{
				$response['status']=502;
				$response['error']=true;
				$response['message']='Login Gagal. Password salah';
			}
		}
		
		return $response;

    }

  }

}

?>
