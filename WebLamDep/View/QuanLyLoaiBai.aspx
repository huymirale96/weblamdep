﻿<%@ Page Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true"  CodeBehind="QuanLyLoaiBai.aspx.cs" Inherits="WebLamDep.View.ThemLoaiBai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">QUẢN LÝ LOẠI BÀI ĐĂNG</h1>
                </div>
            </div>
            <div class="row">sadasd                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Danh sách LOẠI BÀI
                        </div>
                        <div class="panel-body">
                            <div class="text-center">
                                <asp:Label ID="lblNoti" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-md-12">
                                <table class="table table-bordered table-stripped">
							        <thead>
								        <tr>
									        <th class="text-center">STT</th>
									        <th class="text-center">Tên Loại Bài Đăng</th>
									       
									        <th class="text-center">Tác vụ</th>
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptLoaiBai" runat="server">
                                            <ItemTemplate>
                                                <tr>
										            <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="left"><%# Eval("sTenLoaiBai") %></td>
										            
											        <td class="left">
												        <asp:LinkButton ID="btnFix" CssClass="btn btn-xs btn-warning" ToolTip="Sửa" runat="server" OnClick="btnFix_Click" CommandArgument='<%# Eval("iMaLoaiBai") %>'><i class="fa fa-times" aria-hidden="true"></i></asp:LinkButton>
                                                        <asp:LinkButton ID="btnDelete" CssClass="btn btn-xs btn-danger" ToolTip="Xoá" runat="server" OnClick="btnDelete_Click"  OnClientClick="return confirm('Bạn có chắc chắn xoá ?')" CommandArgument='<%# Eval("iMaLoaiBai") %>'><i class="fa fa-times" aria-hidden="true"></i></asp:LinkButton>
											        </td>
									            </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
							        </tbody>
						        </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" id="titleForm" runat="server">
                            Bổ sung LOẠI BÀI ĐĂNG
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4">Tên Loại Bài</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="tenLoaiBai" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnThem" runat="server" CssClass="btn btn-primary" OnClick="btnThem_Click" Text="Lưu" />
                                </div>
                                <div class="col-md-6">
                                  
                                </div>
                                <div class="col-md-12">
                                    <div class="pull-right">
                                        
                                        <%--<asp:Button ID="btnSaveFix" Visible="false" runat="server" CssClass="btn btn-primary" OnClick="btnSaveFix_Click" Text="Lưu" />
                                        <asp:Button ID="btnHuy" Visible="false" runat="server" CssClass="btn btn-default" OnClick="btnHuy_Click" Text="Huỷ" ToolTip="Huỷ chỉnh sửa" />--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <style>
        .control-label-left{
            padding-top: 7px;
            margin-bottom: 0;
            text-align: left;
        }
    </style>
</asp:Content>