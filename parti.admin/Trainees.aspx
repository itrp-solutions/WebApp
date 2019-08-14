﻿<%@ Page Title="ຂໍ້ມູນຜູ້ຝຶກ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Trainees.aspx.cs" Inherits="parti.admin.Trainee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="scm" runat="server" EnablePageMethods="true" />
    <script src="Scripts/jquery.simpleLoadMore.min.js"></script>
    <link href="dist/css/dropify.css" rel="stylesheet" />
    <script src="dist/js/dropify.js"></script>

    <style>
        .bottom-sheet {
            min-height: 90%;
        }

        .table {
            font-family: PhetsarathOT;
        }

        .modal {
            font-family: PhetsarathOT;
        }

        .input-field {
            font-family: PhetsarathOT;
        }

        .dropify-wrapper {
            font-family: PhetsarathOT;
        }

        .dropify-clear {
            font-family: PhetsarathOT;
        }
    </style>
    <br />
    <br />
    <%-- Search Box --%>
    <div class="row">
        <div class="col s6 m6 l6 ">
            <div class="input-field">
                <label for="txtSearch">ຄົ້ນຫາ</label>
                <input id="txtSearch" runat="server" type="text" class="laotxt" />
                <span class="helper-text">ຂໍ້ມູນທີ່ສາມາດຄົ້ນຫາໄດ້: ຊື່ ແລະ ນາມສະກຸນ...</span>
            </div>
        </div>
        <div class="col">
            <br />
            <a class="hvr-grow-shadow btn-floating red darken-3 left z-depth-3 tooltipped" data-position="bottom" data-tooltip="ຄົ້ນຫາ" onclick="Search()" id="btnSearch">
                <i class="material-icons">search</i>
            </a>
        </div>
        <div class="col">
            <br />
            <a class="hvr-grow-shadow btn-floating blue tooltipped modal-trigger left z-depth-3" href="#modalTrainee" data-position="bottom" data-tooltip="ເພີ່ມ" onclick="SetTraineeInfo('-1')">
                <i class="material-icons">add</i>
            </a>
        </div>
    </div>
    <%-- Search Box --%>

    <%-- Total Trainer --%>
    <div class="row">
        <div class="col">
            <h5 class="grey-text darken-3">ຈຳນວນຜູ້ຝຶກອົບຮົມທັງຫມົດ:</h5>
        </div>
        <div class="col">
            <h5 class="red-text darken-3" id="lblTotalTrainer" runat="server">0</h5>
        </div>
    </div>
    <%-- Total Trainer --%>

    <%-- Table --%>
    <div class="row" id="tbTrainees">
        <div class="col s12 m12 l12">
            <table>
                <thead>
                    <tr>
                        <th>ລຳດັບ</th>
                        <th>ຮູບພາບ</th>
                        <th>ລະຫັດລັດຖະກອນ</th>
                        <th>ຊື່ເຕັມ</th>
                        <th>ບ່ອນປະຈຳການ</th>
                        <th>ແກ້ໄຂ</th>
                    </tr>
                </thead>
                <tbody id="tbBody" class="some-list" runat="server">
                </tbody>
            </table>
            <br>
            <br>
            <a href="#!" class="btn-flat waves-effect waves-light right tooltipped blue-text text-darken-3" data-position="right" data-tooltip="ກັບຂື້ນເທີງ" onclick="ScrollTop()">ກັບຂື້ນເທີງ</a>
        </div>
    </div>
    <%-- Table --%>

    <%-- Modal Trainee --%>
    <div id="modalTrainee" class="modal bottom-sheet">
        <%-- New Form --%>
        <div class="modal-content">
            <div class="row">
                <div class="col s12 m3 l3" align="center">
                    <div id="profile-container">
                        <img id="profileImage" runat="server" src="img/avatar.png" class="img responsive-img tooltipped" data-position="left" data-tooltip="ປ່ຽນຮູບພາບ 150x150" />
                    </div>
                    <asp:FileUpload ID="imageUpload" runat="server" name="profile_photo" class="imageUpload" />
                </div>
                <br />
                <div class="col s12 m9 l9">
                    <ul class="tabs">
                        <li class="tab col"><a href="#tab1" class="grey-text">1. ປະຫວັດສ່ວນຕົວ</a></li>
                        <li class="tab col"><a href="#tab2" class="grey-text">2. ວຸດທິການສຶກສາ</a></li>
                        <li class="tab col"><a href="#tab3" class="grey-text">3. ບ່ອນປະຈຳການປະຈຸບັນ</a></li>
                        <li class="tab col"><a href="#tab4" class="grey-text">4. ການຈັດຕັ້ງທີ່ອານຸມັດ (ຜູ້ທີ່ຕົກລົງໃຫ້ເຂົ້າຮ່ວມຝຶກອົບຮົມ)</a></li>
                        <li class="tab col"><a href="#tab5" class="grey-text">5. ການຈັດການຟຣາຍເອກະສານແນບເຂົ້າໃນລະບົບ</a></li>
                    </ul>
                    <h5>ຂໍ້ມູນຜູ້ຝຶກອົບຮົມ</h5>
                    <hr>
                    <br />
                    <div id="tab1" class="row">
                        <h6>1. ປະຫວັດສ່ວນຕົວ</h6>
                        <br />
                        <div class="row">
                            <div class="input-field col s12 m12 l12">
                                <label for="txtID">ລະຫັດລັດຖະກອນ</label>
                                <input type="text" id="txtID" runat="server" class="validate laotxt" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m6 l6">
                                <label for="txtNameLA">ຊື່ນາມສະກຸນ ພາສາລາວ</label>
                                <input type="text" id="txtNameLA" runat="server" class="validate laotxt" required />
                            </div>
                            <div class="input-field col s12 m6 l6">
                                <label for="txtNameEng">ຊື່ນາມສະກຸນ ພາສາອັງກິດ</label>
                                <input type="text" id="txtNameEng" runat="server" class="validate laotxt" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6 l6">
                                <label for="dtpBD">ວັນເດືອນປີເກີດ</label>
                                <input type="text" class="datepicker" runat="server" id="dtpBD" required />
                                <span class="helper-text" data-error="ສະເພາະວັນທີ." data-success="ວັນເດືອນປີເກີດ."></span>
                            </div>
                            <div class="input-field col s12 m6 l6">
                                <br />
                                <div>
                                    <span class="grey-text">ເພດ:</span>
                                    <label>
                                        <input class="with-gap" type="radio" id="rdMale" runat="server" name="rdSex" checked /><span>ຊາຍ</span>
                                    </label>
                                    <label>
                                        <input class="with-gap" type="radio" id="rdFamale" runat="server" name="rdSex" /><span>ຍິງ</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m12 l12">
                                <br />
                                <div>
                                    <span class="grey-text">ສະຖານະພາບ:</span>
                                    <label>
                                        <input class="with-gap" type="radio" id="rdMarried" runat="server" name="rdStatus" checked /><span>ໂສດ</span>
                                    </label>
                                    <label>
                                        <input class="with-gap" type="radio" id="rdSingle" runat="server" name="rdStatus" /><span>ແຕ່ງງານ</span>
                                    </label>
                                    <label>
                                        <input class="with-gap" type="radio" id="rdDivorce" runat="server" name="rdStatus" /><span>ຍ່າຮ້າງ</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m4 l4">
                                <label for="txtVillage">ບ້ານ</label>
                                <input type="text" id="txtVillage" runat="server" class="validate autocomplete laotxt" required autocomplete="off" />
                            </div>
                            <div class="input-field col s12 m4 l4">
                                <label for="txtDistrict">ເມືອງ</label>
                                <input type="text" id="txtDistrict" runat="server" class="validate autocomplete laotxt" required autocomplete="off" />
                            </div>
                            <div class="input-field col s12 m4 l4">
                                <label for="txtProvince">ແຂວງ</label>
                                <input type="text" id="txtProvince" runat="server" class="validate autocomplete laotxt" required autocomplete="off" />
                            </div>
                        </div>
                    </div>
                    <br />
                    <div id="tab2" class="row">
                        <h6>2. ວຸດທິການສຶກສາ</h6>
                        <br />
                        <div class="row">
                            <div class="input-field col s12 m6 l6">
                                <label for="txtEducation_level">ວິຊາສະເພາະທີ່ຮຽນຈົບຊັ້ນ</label>
                                <input type="text" id="txtEducation_level" runat="server" class="validate laotxt" required />
                                <span class="helper-text">ຕົວຢ່າງ: ຊັ້ນຕົ້ນ, ຊັ້ນກາງ, ຊັ້ນສູງ, ປະລິນຍາຕີ, ປະລິນຍາໂທ, ປະລິນຍາເອກ...</span>
                            </div>
                            <div class="input-field col s12 m6 l6">
                                <label for="txtEducation_major">ສາຂາວິຊາ ຫລື ວິຊາຮຽນ</label>
                                <input type="text" id="txtEducation_major" runat="server" class="validate laotxt" required />
                                <span class="helper-text">ຕົວຢ່າງ: ວິທະຍາສາດການປົກຄອງ, ຄູ...</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m12 l12">
                                <br />
                                <div>
                                    <span class="grey-text">ບ່ອນຮຽນ:</span>
                                    <label>
                                        <input class="with-gap" type="radio" id="rdEduIn" runat="server" name="rdEducation_country" checked /><span>ຈົບຈາກພາຍໃນ</span>
                                    </label>
                                    <label>
                                        <input class="with-gap" type="radio" id="rdEduOut" runat="server" name="rdEducation_country" /><span>ຈົບຈາກຕ່າງປະເທດ</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m6 l6">
                                <label for="txtEducation_Name">ຊື່ສະຖານສຶກສາ</label>
                                <input type="text" id="txtEducation_Name" runat="server" class="validate laotxt" required />
                            </div>
                            <div class="input-field col s12 m6 l6">
                                <label for="txtEducated_year">ສົກປີຮຽນຈົບ</label>
                                <input type="text" id="txtEducated_year" runat="server" class="validate laotxt" required />
                            </div>
                        </div>
                    </div>
                    <br />
                    <div id="tab3" class="row">
                        <h6>3. ບ່ອນປະຈຳການປະຈຸບັນ</h6>
                        <br />
                        <div class="row">
                            <div class="input-field col s12 m6 l6">
                                <label for="txtWork_place">ກະຊວງ/ແຂວງ/ເມືອງ</label>
                                <input type="text" id="txtWork_place" runat="server" class="validate laotxt" required />
                            </div>
                            <div class="input-field col s12 m6 l6">
                                <label for="txtDepartment">ກົມ/ພະແນກ/ຫ້ອງການ</label>
                                <input type="text" id="txtDepartment" runat="server" class="validate laotxt" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m6 l6">
                                <label for="txtPosition">ຕຳແໜ່ງ</label>
                                <input type="text" id="txtPosition" runat="server" class="validate laotxt" required />
                            </div>

                            <div class="input-field col s12 m6 l6">
                                <label for="txtDate_of_govermented">ວັນສັງກັດລັດ</label>
                                <input type="text" id="txtDate_of_govermented" runat="server" class="datepicker validate laotxt" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m4 l4">
                                <label for="txtOffice_tel">ເບີໂທຫ້ອງການ</label>
                                <input type="text" id="txtOffice_tel" runat="server" class="validate laotxt" required />
                            </div>
                            <div class="input-field col s12 m4 l4">
                                <label for="txtMobile_tel">ເບີມືຖື</label>
                                <input type="text" id="txtMobile_tel" runat="server" class="validate laotxt" required />
                            </div>
                            <div class="input-field col s12 m4 l4">
                                <label for="txtEmail">ອີເມວ</label>
                                <input type="text" id="txtEmail" runat="server" class="validate laotxt" required />
                            </div>
                        </div>
                    </div>
                    <br />
                    <div id="tab4" class="row">
                        <h6>4. ການຈັດຕັ້ງທີ່ອານຸມັດ (ຜູ້ທີ່ຕົກລົງໃຫ້ເຂົ້າຮ່ວມຝຶກອົບຮົມ)</h6>
                        <br />
                        <div class="row">
                            <div class="input-field col s12 m6 l6">
                                <label for="txtAppr_Fullname">ຊື່ ແລະ ນາມສະກຸນ</label>
                                <input type="text" id="txtAppr_Fullname" runat="server" class="validate laotxt" required />
                            </div>
                            <div class="input-field col s12 m6 l6">
                                <label for="txtAppr_Relationship_trainee">ສາຍພົວພັນກັບຜູ້ສະໝັກ</label>
                                <input type="text" id="txtAppr_Relationship_trainee" runat="server" class="validate laotxt" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m4 l4">
                                <label for="txtAppr_Position_name">ຕຳແໜ່ງ</label>
                                <input type="text" id="txtAppr_Position_name" runat="server" class="validate laotxt" required />
                            </div>
                            <div class="input-field col s12 m4 l4">
                                <label for="txtAppr_Position_major">ໜ້າທີ່ຮັບຜິດຊອບຊີ້ນຳ</label>
                                <input type="text" id="txtAppr_Position_major" runat="server" class="validate laotxt" required />
                            </div>
                            <div class="input-field col s12 m4 l4">
                                <label for="txtAppr_Office_name">ຊື່ສຳນັກງານ</label>
                                <input type="text" id="txtAppr_Office_name" runat="server" class="validate laotxt" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m4 l4">
                                <label for="txtAppr_Office_tel">ເບີໂທຫ້ອງການ</label>
                                <input type="text" id="txtAppr_Office_tel" runat="server" class="validate laotxt" required />
                            </div>
                            <div class="input-field col s12 m4 l4">
                                <label for="txtAppr_Mobile_tel">ເບີມືຖື</label>
                                <input type="text" id="txtAppr_Mobile_tel" runat="server" class="validate laotxt" required />
                            </div>
                            <div class="input-field col s12 m4 l4">
                                <label for="txtAppr_Email">ອີເມວ</label>
                                <input type="text" id="txtAppr_Email" runat="server" class="validate laotxt" required />
                            </div>
                        </div>
                    </div>
                    <br />
                    <div id="tab5" class="row">
                        <h6>5. ການຈັດການຟຣາຍເອກະສານແນບເຂົ້າໃນລະບົບ</h6>
                        <br />
                        <div class="row">
                            <div class="col s12 m6 l6">
                                <div class="file-field input-field">
                                    <div class="btn btn-small">
                                        <span>ຮູບພາບຜູ້ຝຶກອົບຮົມ</span>
                                        <input type="file">
                                    </div>
                                    <div class="file-path-wrapper">
                                        <asp:FileUpload type="file" ID="txtAvatar" placeholder="ຮູບພາບຜູ້ຝຶກອົບຮົມ" runat="server" onchange="LabelMe(this)" />
                                        <label id="txtAvatarHidd" runat="server" style="font-size: large"></label>
                                        <input type="hidden" id="txtAvatarHidd_I" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m6 l6">
                                <a class="btn btn-flat right" onclick="PreviewIMG(document.getElementById('<%: txtAvatarHidd_I.ClientID %>').value)">
                                    <i class="material-icons">pageview</i>
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6 l6">
                                <div class="file-field input-field">
                                    <div class="btn btn-small">
                                        <span>ເອກະສານແນບທີ1</span>
                                        <input type="file">
                                    </div>
                                    <div class="file-path-wrapper">
                                        <asp:FileUpload type="file" class="file-path validate" ID="txtReferDoc1" placeholder="ເອກະສານແນບທີ1" runat="server" onchange="LabelMe(this)" />
                                        <label id="txtReferDoc1Hidd" runat="server" style="font-size: large"></label>
                                        <input type="hidden" id="txtReferDoc1Hidd_I" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m6 l6">
                                <a class="btn btn-flat right" onclick="PreviewIMG(document.getElementById('<%: txtReferDoc1Hidd_I.ClientID %>').value)">
                                    <i class="material-icons">pageview</i>
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6 l6">
                                <div class="file-field input-field">
                                    <div class="btn btn-small">
                                        <span>ເອກະສານແນບທີ2</span>
                                        <input type="file">
                                    </div>
                                    <div class="file-path-wrapper">
                                        <asp:FileUpload type="file" class="file-path validate" ID="txtReferDoc2" placeholder="ເອກະສານແນບທີ2" runat="server" onchange="LabelMe(this)" />
                                        <label id="txtReferDoc2Hidd" runat="server" style="font-size: large"></label>
                                        <input type="hidden" id="txtReferDoc2Hidd_I" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m6 l6">
                                <a class="btn btn-flat right" onclick="PreviewIMG(document.getElementById('<%: txtReferDoc2Hidd_I.ClientID %>').value)">
                                    <i class="material-icons">pageview</i>
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6 l6">
                                <div class="file-field input-field">
                                    <div class="btn btn-small">
                                        <span>ເອກະສານແນບທີ3</span>
                                        <input type="file">
                                    </div>
                                    <div class="file-path-wrapper">
                                        <asp:FileUpload type="file" class="file-path validate" ID="txtReferDoc3" placeholder="ເອກະສານແນບທີ3" runat="server" onchange="LabelMe(this)" />
                                        <label id="txtReferDoc3Hidd" runat="server" style="font-size: large"></label>
                                        <input type="hidden" id="txtReferDoc3Hidd_I" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m6 l6">
                                <a class="btn btn-flat right" onclick="PreviewIMG(document.getElementById('<%: txtReferDoc3Hidd_I.ClientID %>').value)">
                                    <i class="material-icons">pageview</i>
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6 l6">
                                <div class="file-field input-field">
                                    <div class="btn btn-small">
                                        <span>ເອກະສານແນບທີ4</span>
                                        <input type="file">
                                    </div>
                                    <div class="file-path-wrapper">
                                        <asp:FileUpload type="file" class="file-path validate" ID="txtReferDoc4" placeholder="ເອກະສານແນບທີ4" runat="server" onchange="LabelMe(this)" />
                                        <label id="txtReferDoc4Hidd" runat="server" style="font-size: large"></label>
                                        <input type="hidden" id="txtReferDoc4Hidd_I" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m6 l6">
                                <a class="btn btn-flat right" onclick="PreviewIMG(document.getElementById('<%: txtReferDoc4Hidd_I.ClientID %>').value)">
                                    <i class="material-icons">pageview</i>
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6 l6">
                                <div class="file-field input-field">
                                    <div class="btn btn-small">
                                        <span>ເອກະສານແນບທີ5</span>
                                        <input type="file">
                                    </div>
                                    <div class="file-path-wrapper">
                                        <asp:FileUpload type="file" class="file-path validate" ID="txtReferDoc5" placeholder="ເອກະສານແນບທີ5" runat="server" onchange="LabelMe(this)" />
                                        <label id="txtReferDoc5Hidd" runat="server" style="font-size: large"></label>
                                        <input type="hidden" id="txtReferDoc5Hidd_I" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m6 l6">
                                <a class="btn btn-flat right" onclick="PreviewIMG(document.getElementById('<%: txtReferDoc5Hidd_I.ClientID %>').value)">
                                    <i class="material-icons">pageview</i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <%-- New Form --%>
        <div class="modal-footer">
            <div class="row">
                <div class="col s12 m3 l3"></div>
                <div class="col s12 m1 l1">
                    <asp:Button class="btn-small waves-effect waves-light laotxt" ID="btnSave" runat="server" OnClick="btnSave_OnClick" Text="ບັນທຶກ"></asp:Button>
                    <input type="hidden" id="Hidden1" runat="server" />
                    <input type="hidden" id="avartaUrl" runat="server" />
                </div>
                <div class="col s12 m1 l1">
                    <a class="btn-small waves-effect waves-light modal-close laotxt">ຍົກເລີກ</a>
                </div>
                <div class="col s12 m7 l7">
                    <asp:Button class="btn-small waves-effect waves-light right red darken-3 laotxt" ID="btnDel" runat="server" Text="ລົບ" OnClick="btnDel_OnClick"></asp:Button>
                </div>
            </div>
            <input type="hidden" id="btnState" runat="server" />
        </div>
    </div>
    <%-- Modal Trainee --%>

    <%-- JS --%>
    <script type="text/javascript">

        var itemVillage = {};
        var itemDistrict = {};
        var itemProvince = {};

        setTimeout(function () {
            GetAutocompleteVil();
            $('#<%: txtVillage.ClientID %>.autocomplete').autocomplete({
                data: itemVillage,
                limit: 20, onAutocomplete: function (val) { }, minLength: 2
            });
            GetAutocompleteDis();
            $('#<%: txtDistrict.ClientID %>.autocomplete').autocomplete({
                data: itemDistrict,
                limit: 20, onAutocomplete: function (val) { }, minLength: 2
            });
            GetAutocompletePro();
            $('#<%: txtProvince.ClientID %>.autocomplete').autocomplete({
                data: itemProvince,
                limit: 10, onAutocomplete: function (val) { }, minLength: 2
            });
        }, 2000);

        function GetAutocompleteVil() {
            $.ajax({
                type: "POST",
                url: "<%: ResolveUrl("Training.aspx/GetVillages") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var obj = response.d;
                    $.each(obj,
                        function (key, value) {
                            itemVillage['' + value.v_name + ''] = null;
                            alert('Village');
                        });
                },
                failure: function (response) {
                    swalModal('error', response.d, '');
                }
            });
        }

        function GetAutocompleteDis() {
            $.ajax({
                type: "POST",
                url: "<%: ResolveUrl("Training.aspx/GetDistricts") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var obj = response.d;
                    $.each(obj,
                        function (key, value) {
                            itemDistrict['' + value.d_name + ''] = null;
                        });
                },
                failure: function (response) {
                    swalModal('error', response.d, '');
                }
            });
        }

        function GetAutocompletePro() {
            $.ajax({
                type: "POST",
                url: "<%: ResolveUrl("Training.aspx/GetProvinces") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var obj = response.d;
                    $.each(obj,
                        function (key, value) {
                            itemProvince['' + value.p_name + ''] = null;
                        });
                },
                failure: function (response) {
                    swalModal('error', response.d, '');
                }
            });
        }

        function PreviewIMG(file) {
            if (file != '') {
                window.open(file);
            } else {
                swalToast('info', 'e1: ບໍ່ມີໄຟຣທີ່ຈະສະແດງ...');
            }
        }

        function LabelMe(obj) {
            var label_name = obj.id + "Hidd";
            var input_name = obj.id + "Hidd_I";
            document.getElementById(label_name).innerText = obj.value;
        }

        $(document).ready(function () {
            $('.tooltipped').tooltip();
            $('.tabs').tabs();
            $('.datepicker').datepicker({
                format: 'mm/dd/yyyy'
            });
            $('.some-list').simpleLoadMore({
                item: 'tr',
                count: 5,
                btnHTML: '<br><br><a href="#" id="btnMore" class="load-more_btn btn-flat waves-effect tooltipped blue-text text-darken-3" data-position="left" data-tooltip="ເບີ່ງສ່ວນທີ່ເຫລືອ" onclick="ScrollDown()">ເບີ່ງສ່ວນທີ່ເຫລືອ...</a>'
            });
            $('.materialboxed').materialbox();
        });

        function ScrollDown() {
            $('html,body').animate({ scrollTop: 9999 }, 'slow');
        }

        function ScrollTop() {
            $('html,body').animate({ scrollTop: 0 }, 'slow');
        }

        function Search() {
            var txt = document.getElementById('<%: txtSearch.ClientID %>').value;
            $('.search_result:not(:contains("' + txt + '"))').hide("slow");
            $('.search_result:contains("' + txt + '")').show("slow");
            if (txt == '') {
                window.location.reload();
            }
        }

        function SetTraineeInfo(id) {
            var traineeID = id;
            if (traineeID == "-1") {
                ClearTxT();
                document.getElementById("<%: btnState.ClientID %>").value = "add";
            } else {
                document.getElementById("<%: btnState.ClientID %>").value = "edit";
                $.ajax({
                    type: "POST",
                    url: "<%: ResolveUrl("Trainees.aspx/GetTraineeInfo") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{TraineeID:" + traineeID + "}",
                    success: function (response) {
                        var obj = response.d;
                        document.getElementById("<%: txtID.ClientID %>").value = obj.id;
                        document.getElementById("<%: txtNameLA.ClientID %>").value = obj.fullname_la;
                        document.getElementById("<%: txtNameEng.ClientID %>").value = obj.fullname_eng;
                        document.getElementById("<%: dtpBD.ClientID %>").value = obj.date_of_birth;
                        if (obj.sex === "m") {
                            document.getElementById("<%: rdMale.ClientID %>").setAttribute("checked", "checked");
                        } else if (obj.sex === "f") {
                            document.getElementById("<%: rdFamale.ClientID %>").setAttribute("checked", "checked");
                        }
                        if (obj.status === "s") {
                            document.getElementById("<%: rdSingle.ClientID %>").setAttribute("checked", "checked");
                        } else if (obj.status === "d") {
                            document.getElementById("<%: rdDivorce.ClientID %>").setAttribute("checked", "checked");
                        } else if (obj.status === "m") {
                            document.getElementById("<%: rdMarried.ClientID %>").setAttribute("checked", "checked");
                        }
                        document.getElementById("<%: txtVillage.ClientID %>").value = obj.village;
                        document.getElementById("<%: txtDistrict.ClientID %>").value = obj.district;
                        document.getElementById("<%: txtProvince.ClientID %>").value = obj.province;
                        document.getElementById("<%: txtWork_place.ClientID %>").value = obj.work_place;
                        document.getElementById("<%: txtDepartment.ClientID %>").value = obj.department;
                        document.getElementById("<%: txtPosition.ClientID %>").value = obj.position;
                        document.getElementById("<%: txtDate_of_govermented.ClientID %>").value = obj.date_of_govermented;
                        document.getElementById("<%: txtOffice_tel.ClientID %>").value = obj.office_tel;
                        document.getElementById("<%: txtMobile_tel.ClientID %>").value = obj.mobile_tel;
                        document.getElementById("<%: txtEmail.ClientID %>").value = obj.email;
                        document.getElementById("<%: txtAvatarHidd.ClientID %>").innerText = obj.avatar_url;
                        document.getElementById("<%: txtReferDoc1Hidd.ClientID %>").innerText = obj.doc1_url;
                        document.getElementById("<%: txtReferDoc2Hidd.ClientID %>").innerText = obj.doc2_url;
                        document.getElementById("<%: txtReferDoc3Hidd.ClientID %>").innerText = obj.doc3_url;
                        document.getElementById("<%: txtReferDoc4Hidd.ClientID %>").innerText = obj.doc4_url;
                        document.getElementById("<%: txtReferDoc5Hidd.ClientID %>").innerText = obj.doc5_url;
                        document.getElementById("<%: txtAvatarHidd_I.ClientID %>").value = obj.avatar_url;
                        document.getElementById("<%: txtReferDoc1Hidd_I.ClientID %>").value = obj.doc1_url;
                        document.getElementById("<%: txtReferDoc2Hidd_I.ClientID %>").value = obj.doc2_url;
                        document.getElementById("<%: txtReferDoc3Hidd_I.ClientID %>").value = obj.doc3_url;
                        document.getElementById("<%: txtReferDoc4Hidd_I.ClientID %>").value = obj.doc4_url;
                        document.getElementById("<%: txtReferDoc5Hidd_I.ClientID %>").value = obj.doc5_url;
                        document.getElementById("<%: txtAppr_Fullname.ClientID %>").value = obj.appr_fullname;
                        document.getElementById("<%: txtAppr_Position_name.ClientID %>").value = obj.appr_position_name;
                        document.getElementById("<%: txtAppr_Position_major.ClientID %>").value = obj.appr_position_major;
                        document.getElementById("<%: txtAppr_Relationship_trainee.ClientID %>").value = obj.appr_relationship_trainee;
                        document.getElementById("<%: txtAppr_Office_name.ClientID %>").value = obj.appr_office_name;
                        document.getElementById("<%: txtAppr_Office_tel.ClientID %>").value = obj.appr_office_tel;
                        document.getElementById("<%: txtAppr_Mobile_tel.ClientID %>").value = obj.appr_mobile_tel;
                        document.getElementById("<%: txtAppr_Email.ClientID %>").value = obj.appr_email;
                        document.getElementById("<%: txtEducation_level.ClientID %>").value = obj.education_level;
                        document.getElementById("<%: txtEducation_major.ClientID %>").value = obj.education_major;
                        if (obj.education_country === "in") {
                            document.getElementById("<%: rdEduIn.ClientID %>").setAttribute("checked", "checked");
                        } else if (obj.education_country === "out") {
                            document.getElementById("<%: rdEduOut.ClientID %>").setAttribute("checked", "checked");
                        }
                        document.getElementById("<%: txtEducation_Name.ClientID %>").value = obj.education_name;
                        document.getElementById("<%: txtEducated_year.ClientID %>").value = obj.educated_year;
                        M.updateTextFields();
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            CheckBtnPreview();
        }

        function ClearTxT() {
            document.getElementById("<%: txtID.ClientID %>").value = "";
            document.getElementById("<%: txtNameLA.ClientID %>").value = "";
            document.getElementById("<%: txtNameEng.ClientID %>").value = "";
            document.getElementById("<%: dtpBD.ClientID %>").value = "";
            document.getElementById("<%: txtVillage.ClientID %>").value = "";
            document.getElementById("<%: txtDistrict.ClientID %>").value = "";
            document.getElementById("<%: txtProvince.ClientID %>").value = "";
            document.getElementById("<%: txtWork_place.ClientID %>").value = "";
            document.getElementById("<%: txtDepartment.ClientID %>").value = "";
            document.getElementById("<%: txtPosition.ClientID %>").value = "";
            document.getElementById("<%: txtDate_of_govermented.ClientID %>").value = "";
            document.getElementById("<%: txtOffice_tel.ClientID %>").value = "";
            document.getElementById("<%: txtMobile_tel.ClientID %>").value = "";
            document.getElementById("<%: txtEmail.ClientID %>").value = "";
            document.getElementById("<%: txtAvatarHidd.ClientID %>").innerText = "";
            document.getElementById("<%: txtReferDoc1Hidd.ClientID %>").innerText = "";
            document.getElementById("<%: txtReferDoc2Hidd.ClientID %>").innerText = "";
            document.getElementById("<%: txtReferDoc3Hidd.ClientID %>").innerText = "";
            document.getElementById("<%: txtReferDoc4Hidd.ClientID %>").innerText = "";
            document.getElementById("<%: txtReferDoc5Hidd.ClientID %>").innerText = "";
            document.getElementById("<%: txtAppr_Fullname.ClientID %>").value = "";
            document.getElementById("<%: txtAppr_Position_name.ClientID %>").value = "";
            document.getElementById("<%: txtAppr_Position_major.ClientID %>").value = "";
            document.getElementById("<%: txtAppr_Relationship_trainee.ClientID %>").value = "";
            document.getElementById("<%: txtAppr_Office_name.ClientID %>").value = "";
            document.getElementById("<%: txtAppr_Office_tel.ClientID %>").value = "";
            document.getElementById("<%: txtAppr_Mobile_tel.ClientID %>").value = "";
            document.getElementById("<%: txtAppr_Email.ClientID %>").value = "";
            document.getElementById("<%: txtEducation_level.ClientID %>").value = "";
            document.getElementById("<%: txtEducation_major.ClientID %>").value = "";
            M.updateTextFields();
        }

        function CheckBtnPreview() {
            var state = document.getElementById("<%: btnState.ClientID %>").value;
            if (state === 'add') {
                $('#btnPreview').addClass('disabled');
            } else if (state === 'edit') {
                $('#btnPreview').removeClass('disabled');
            }
        }

        function UUID() {
            var dt = new Date().getTime();
            var uuid = 'xxxxxxxx-xxxx-8xxx-Qxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                var r = (dt + Math.random() * 16) % 16 | 0;
                dt = Math.floor(dt / 16);
                return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
            });
            return uuid;
        }

    </script>
    <%-- JS --%>
</asp:Content>
