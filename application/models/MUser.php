<?php

// extends class Model
class MUser extends CI_Model
{

    // response jika field ada yang kosong
    public function empty_response()
    {
        $response['status'] = 502;
        $response['error'] = true;
        $response['message'] = 'Field tidak boleh kosong';
        return $response;
    }

    public function login($email, $password)
    {

        if (empty($email) || empty($password)) {

            return $this->empty_response();

        } else {
            $password = md5($password);
            $response = null;
            $where = array(
                "email" => $email
            );

            $this->db->where($where);
            $select = $this->db->get("users")->result();

            if (!$select) {

                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Login Gagal. User tidak ditemukan';

            } else {

                $where = array(
                    "a.email" => $email,
                    "a.password" => $password
                );

                $this->db->select('*');
                $this->db->from('users a');
                $this->db->join('users_metadata b', 'a.uuid = b.user_id');
                $this->db->where($where);
                $query = $this->db->get();

                if ($query->result()) {
                    $response['status'] = 200;
                    $response['error'] = false;
                    $response['message'] = 'Login sukses';
                    $response['user'] = $query->result();
                } else {
                    $response['status'] = 502;
                    $response['error'] = true;
                    $response['message'] = 'Login Gagal. Password salah';
                }
            }

            return $response;

        }

    }

    public function register($userId, $email, $password, $name, $phone, $address, $profileImg)
    {

        $response = null;

        if ($userId != "" && $email != "" && $password != "" && $name != "") {

            $currentTime = date("Y-m-d H:i:s");
            $password = md5($password);

            $data = array(
                'uuid' => $userId,
                'email' => $email,
                'password' => $password,
                'created_at' => $currentTime
            );

            //insert into table users
            $execute = $this->db->insert('users', $data);

            if ($execute) {

                $id = $this->db->insert_id();

                $data = array(
                    'user_id' => $userId,
                    'firstname' => $name,
                    'phone' => $phone,
                    'address' => $address
                );

                //insert into table users
                $execute = $this->db->insert('users_metadata', $data);

                if ($execute) {

                    $imgName = "";
                    $imgBgName = "profile_bg.jpg";

                    if ($profileImg != "") {
                        if (preg_match('/^data:image\/(\w+);base64,/', $profileImg, $type)) {
                            $data = substr($profileImg, strpos($profileImg, ',') + 1);
                            $type = strtolower($type[1]); // jpg, png, gif

                            if (!in_array($type, array('jpg', 'jpeg', 'gif', 'png'))) {
                                $response['status'] = 303;
                                $response['error'] = true;
                                $response['message'] = 'invalid image type';
                                throw new \Exception('invalid image type');
                            }

                            $data = base64_decode($data);

                            if ($data === false) {
                                $response['status'] = 304;
                                $response['error'] = true;
                                $response['message'] = 'base64_decode failed';
                                throw new \Exception('base64_decode failed');
                            }
                        } else {
                            $response['status'] = 305;
                            $response['error'] = true;
                            $response['message'] = 'did not match data URI with image data';
                            throw new \Exception('did not match data URI with image data');
                        }
                        $userId_ = str_replace("-", "", $userId);
                        $imgName = $userId_ . ".{$type}";
                        $path = "upload/user/" . $imgName;

                        write_file($path, $data);

                    } else {
                        $imgName = "profile.png";
                    }

                    $data = array(
                        'image' => $imgName,
                        'image_bg' => $imgBgName
                    );

                    $where = array(
                        "user_id" => $userId
                    );

                    //update profile image
                    $this->db->update('users_metadata', $data, $where);

                    $response['status'] = 200;
                    $response['error'] = false;
                    $response['message'] = 'Data inserted';

                } else {
                    $response['status'] = 501;
                    $response['error'] = true;
                    $response['message'] = 'Failed insert data';
                }
            } else {
                $response['status'] = 502;
                $response['error'] = false;
                $response['message'] = 'Failed insert data';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function getUserById($userId)
    {

        if (empty($userId)) {

            return $this->empty_response();

        } else {

            $where = array(
                "a.uuid" => $userId
            );

            $this->db->select('*');
            $this->db->from('users a');
            $this->db->join('users_metadata b', 'a.uuid = b.user_id');
            $this->db->where($where);
            $this->db->group_by("a.uuid");
            $query = $this->db->get();

            if ($query->result()) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Success';
                $response['data'] = $query->result();
            } else {
                $response['status'] = 502;
                $response['error'] = true;
                $response['message'] = 'Failed';
                $response['data'] = array();
            }

            return $response;

        }

    }

    public function updateUser($userId, $email, $name, $phone, $address, $profileImg, $profileImgBg)
    {
        $response = null;

        $imgName = "";
        $imgBgName = "";

        if ($profileImg != "") {
            if (preg_match('/^data:image\/(\w+);base64,/', $profileImg, $type)) {
                $data = substr($profileImg, strpos($profileImg, ',') + 1);
                $type = strtolower($type[1]); // jpg, png, gif

                if (!in_array($type, array('jpg', 'jpeg', 'gif', 'png'))) {
                    $response['status'] = 303;
                    $response['error'] = true;
                    $response['message'] = 'invalid image type';
                    throw new \Exception('invalid image type');
                }

                $data = base64_decode($data);

                if ($data === false) {
                    $response['status'] = 304;
                    $response['error'] = true;
                    $response['message'] = 'base64_decode failed';
                    throw new \Exception('base64_decode failed');
                }
            } else {
                $response['status'] = 305;
                $response['error'] = true;
                $response['message'] = 'did not match data URI with image data';
                throw new \Exception('did not match data URI with image data');
            }
            $userId_ = str_replace("-", "", $userId);
            $imgName = "profile_".$userId_ . ".{$type}";
            $path = "upload/user/" . $imgName;

            if ( ! write_file($path, $data)) {

                $response['status']=300;
                $response['error']=true;
                $response['message']='Failed upload';
            } else {
                $data = array(
                    'image' => $imgName
                );

                $where = array(
                    "user_id" => $userId
                );

                //update profile image
                $this->db->update('users_metadata', $data, $where);

                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data updated';
            }
        }

        if ($profileImgBg != "") {
            if (preg_match('/^data:image\/(\w+);base64,/', $profileImgBg, $type)) {
                $data = substr($profileImgBg, strpos($profileImgBg, ',') + 1);
                $type = strtolower($type[1]); // jpg, png, gif

                if (!in_array($type, array('jpg', 'jpeg', 'gif', 'png'))) {
                    $response['status'] = 303;
                    $response['error'] = true;
                    $response['message'] = 'invalid image type';
                    throw new \Exception('invalid image type');
                }

                $data = base64_decode($data);

                if ($data === false) {
                    $response['status'] = 304;
                    $response['error'] = true;
                    $response['message'] = 'base64_decode failed';
                    throw new \Exception('base64_decode failed');
                }
            } else {
                $response['status'] = 305;
                $response['error'] = true;
                $response['message'] = 'did not match data URI with image data';
                throw new \Exception('did not match data URI with image data');
            }
            $userId_ = str_replace("-", "", $userId);
            $imgName = "profile_bg_".$userId_ . ".{$type}";
            $path = "upload/user/" . $imgName;

            if ( ! write_file($path, $data)) {

                $response['status']=300;
                $response['error']=true;
                $response['message']='Failed upload';
            } else {
                $data = array(
                    'image_bg' => $imgName
                );

                $where = array(
                    "user_id" => $userId
                );

                //update profile image_bg
                $this->db->update('users_metadata', $data, $where);

                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data updated';
            }
        }

        if($email) {
            //update user data
            $data = array(
                'email' => $email
            );

            $where = array(
                "uuid" => $userId
            );

            //update profile image
            $this->db->update('users', $data, $where);

            $response['status'] = 200;
            $response['error'] = false;
            $response['message'] = 'Data updated';

        }

        if($name && $phone && $address){
            //update user data
            $data = array(
                'firstname' => $name,
                'phone' => $phone,
                'address' => $address
            );

            $where = array(
                "user_id" => $userId
            );

            //update profile image
            $this->db->update('users_metadata', $data, $where);

            $response['status'] = 200;
            $response['error'] = false;
            $response['message'] = 'Data updated';
        }

        return $response;

    }
}

?>
