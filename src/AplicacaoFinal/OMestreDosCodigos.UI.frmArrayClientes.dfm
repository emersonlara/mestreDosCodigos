inherited frmArrayClientes: TfrmArrayClientes
  Caption = 'Array Din'#226'mico de Clientes'
  ClientHeight = 481
  ClientWidth = 706
  OnCreate = FormCreate
  ExplicitWidth = 722
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 217
    Top = 0
    Width = 489
    Height = 481
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 5
      Top = 48
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label3: TLabel
      Left = 145
      Top = 48
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object Label9: TLabel
      Left = 284
      Top = 48
      Width = 80
      Height = 13
      Caption = 'Data nascimento'
    end
    object Label10: TLabel
      Left = 4
      Top = 387
      Width = 77
      Height = 13
      Caption = 'Tamanho array:'
    end
    object lblTamanhoArray: TLabel
      Left = 87
      Top = 387
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label11: TLabel
      Left = 4
      Top = 406
      Width = 60
      Height = 13
      Caption = 'Indice atual:'
    end
    object lblIndiceSelecionado: TLabel
      Left = 70
      Top = 406
      Width = 10
      Height = 13
      Caption = '-1'
    end
    object NOME: TEdit
      Left = 5
      Top = 24
      Width = 283
      Height = 21
      TabOrder = 0
    end
    object TELEFONE: TEdit
      Left = 5
      Top = 64
      Width = 133
      Height = 21
      TabOrder = 1
    end
    object EMAIL: TEdit
      Left = 145
      Top = 64
      Width = 133
      Height = 21
      TabOrder = 2
    end
    object DATANASCIMENTO: TDateTimePicker
      Left = 284
      Top = 64
      Width = 105
      Height = 21
      Date = 43205.120819305560000000
      Time = 43205.120819305560000000
      TabOrder = 3
    end
    object btnIncluir: TButton
      Left = 6
      Top = 331
      Width = 112
      Height = 43
      Action = actIncluir
      Images = ImageList1
      TabOrder = 5
      WordWrap = True
    end
    object btnAlterar: TButton
      Left = 145
      Top = 331
      Width = 112
      Height = 43
      Action = actAlterar
      Images = ImageList1
      TabOrder = 6
      WordWrap = True
    end
    object btnExcluir: TButton
      Left = 270
      Top = 331
      Width = 112
      Height = 43
      Action = actExcluir
      Images = ImageList1
      TabOrder = 7
      WordWrap = True
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 91
      Width = 419
      Height = 190
      Caption = ' Endere'#231'o '
      TabOrder = 4
      object Label4: TLabel
        Left = 13
        Top = 21
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object Label5: TLabel
        Left = 351
        Top = 21
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label6: TLabel
        Left = 13
        Top = 101
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label7: TLabel
        Left = 13
        Top = 141
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label8: TLabel
        Left = 13
        Top = 61
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label12: TLabel
        Left = 118
        Top = 141
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label13: TLabel
        Left = 296
        Top = 141
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object BAIRRO: TEdit
        Left = 13
        Top = 77
        Width = 394
        Height = 21
        TabOrder = 2
      end
      object CEP: TEdit
        Left = 13
        Top = 157
        Width = 99
        Height = 21
        TabOrder = 4
      end
      object COMPLEMENTO: TEdit
        Left = 13
        Top = 117
        Width = 394
        Height = 21
        TabOrder = 3
      end
      object LOGRADOURO: TEdit
        Left = 13
        Top = 37
        Width = 331
        Height = 21
        TabOrder = 0
      end
      object NUMERO: TEdit
        Left = 351
        Top = 37
        Width = 56
        Height = 21
        TabOrder = 1
      end
      object CIDADE: TEdit
        Left = 118
        Top = 157
        Width = 171
        Height = 21
        TabOrder = 5
      end
      object UF: TComboBox
        Left = 296
        Top = 157
        Width = 113
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO'
          'ER')
      end
    end
  end
  object lstClientes: TListBox
    Left = 0
    Top = 0
    Width = 217
    Height = 481
    Align = alLeft
    ItemHeight = 13
    TabOrder = 1
    OnClick = lstClientesClick
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 633
    Top = 440
    object actIncluir: TAction
      Caption = 'Incluir'
      ImageIndex = 0
      OnExecute = actIncluirExecute
    end
    object actExcluir: TAction
      Caption = 'Excluir'
      ImageIndex = 1
      OnExecute = actExcluirExecute
    end
    object actAlterar: TAction
      Caption = 'Alterar selecionado'
      Enabled = False
      ImageIndex = 2
      OnExecute = actAlterarExecute
    end
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    ImageType = itMask
    Left = 665
    Top = 440
    Bitmap = {
      494C010103000500040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000020000
      000A05020138301A0D946A391FD1874926EA854726E867381ED02F190D930301
      0030000000090000000100000000000000000000000000000000000000020000
      000C010007460B0536AB160A68E31C0D89FF1B0D89FF160A69E40C0537AD0100
      084D0000000E0000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000300000011341C
      0F97A65F37FAC58956FFD6A36CFFDDAF74FFDDAF73FFD6A46AFFC58955FF9D5C
      34F51A0E08730000000F00000003000000000000000000000003000000190C06
      38A9201493FF2124AEFF232FC2FF2434CBFF2434CCFF232FC3FF2124AFFF2014
      94FF0D073DB20000001E0000000400000000000000002B162280AB5889FFAB58
      89FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB58
      89FFAB5889FFAB5889FF2B162280000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000200000010532F1BB9BC7B
      4CFFDDAE76FFDEB075FFE2B782FFE3BB87FFE3BC86FFE1B782FFDEAF73FFDBAB
      71FFBD7D4DFF4E2B19B500000010000000020000000200000015160E59CD2421
      A6FF2C3CCCFF384AD3FF3344D1FF2838CDFF2738CDFF3243D0FF3849D4FF2C3B
      CDFF2422A8FF160E5BD20000001D0000000300000000AB5889FFAB5889FFAB58
      89FFFFFFFEFFFFFFFEFFAB5889FFAB5889FFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
      FEFFAB5889FFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000008351F1295BE8052FFE0B3
      7BFFDFB075FFDEB176FFB78253FFAA7043FFAB7144FFBC8858FFDFB278FFDFB2
      76FFDEB076FFC08252FF301C10920000000A00000009100B3BA72926AAFF2E40
      D0FF3440C7FF2625ABFF3036BCFF3749D3FF374AD3FF3036BCFF2625ABFF343F
      C7FF2D3FD0FF2826ACFF110B40B10000000D00000000AB5889FFAB5889FFAB58
      89FFFFFFFEFFFFFFFEFFAB5889FFAB5889FFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
      FEFFAB5889FFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004020132AC6D45FADFB27CFFDFB2
      79FFE0B37AFFE0B57CFFA56A3EFFF5EFEAFFF8F3EEFFAB7144FFE2B67DFFE0B4
      7BFFE0B47AFFDEB078FFB07048FB0302012F0101063D3028A1FD2B3BCCFF3741
      C6FF5E5CBDFFEDEDF8FF8B89CEFF3236B9FF3336B9FF8B89CEFFEDEDF8FF5E5C
      BDFF3640C6FF2A39CDFF2F27A4FF0202094A00000000AB5889FFAB5889FFAB58
      89FFFFFFFEFFFFFFFEFFAB5889FFAB5889FFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
      FEFFAB5889FFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000038221695CD9B6EFFE2B780FFE5BD
      89FFE7C291FFE8C393FFA56A3EFFF1E6DEFFF9F5F1FFAA7043FFE8C494FFE8C3
      93FFE5BF8CFFE1B77EFFD09C6DFF2D1C118B120E3B9F363ABCFF2F41D0FF2520
      A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1EDFFF3E9E2FFECE6
      EBFF2520A5FF2D3ECFFF3339BEFF161146B000000000AB5889FFAB5889FFAB58
      89FFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
      FEFFAB5889FFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000794D32D2DCB383FFE3B781FFBA86
      58FFA96F42FFAB7144FFAC7245FFF5EDE6FFFAF6F3FFAD7446FFB07749FFB179
      4AFFC29161FFE4B983FFDEB17DFF74492FD02A2480E03441CBFF3345D1FF2B2E
      B5FF806FADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9E2FFEADAD1FF7E6E
      ACFF2A2DB5FF3043D0FF2F3FCBFF2B2586E500000000AB5889FFAB5889FFAB58
      89FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB58
      89FFAB5889FFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A76D47F2E3BF8FFFE4BB84FFA56A
      3EFFF3EBE6FFFAF6F3FFF6EFE8FFF7F0EAFFFBF7F5FFFAF7F4FFFAF7F3FFFAF6
      F2FFAB7144FFE5BD87FFE5BE8BFF9F6946EE3C35AAFA3547D0FF3649D3FF394D
      D5FF3133B4FF8A7EB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EBE5FF897CB8FF3132
      B4FF374AD3FF3446D2FF3345D1FF3C35AAFA00000000AB5889FFAB5889FFAB58
      89FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB58
      89FFAB5889FFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A16C48ECE9C9A0FFE5BE89FFA56A
      3EFFE0D2CAFFE1D3CCFFE3D5CFFFF2EAE4FFF8F3EFFFEADFD9FFE6DAD4FFE9DE
      D9FFAA7043FFE7C08CFFEACA9DFFA26D49EE433DB0FA4456D7FF3A4FD5FF4B5E
      DAFF4242B7FF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7EDE8FF9087C5FF4141
      B7FF485CD8FF384BD4FF3E51D4FF423DAFFA00000000AB5889FFAB5889FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007D563BD0E9CDACFFEAC796FFB784
      55FFA56A3EFFA56A3EFFA56A3EFFF1EAE5FFFAF6F3FFA56A3EFFA56A3EFFA56A
      3EFFB78456FFEACA99FFEBD1ADFF7F573CD437348BDC5866DAFF5A6DDDFF4E4C
      BAFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0EAFFFAF5F2FF8F89
      CAFF4D4CB9FF5669DCFF5664D9FF383691E100000000AB5889FFAB5889FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000402E1F97DDBB9DFFEED3A9FFEECF
      A2FFEED2A5FFF0D6A9FFA56A3EFFF0EAE7FFFDFCFBFFA56A3EFFF1D6AAFFF0D5
      A8FFEED2A5FFEFD4A7FFE0C2A2FF36271B8F1B1A42987B85DDFF8798E8FF281C
      9BFFE5DADEFFF6EEEBFFEDDFDAFF816DA9FF816DA9FFEDDFD8FFF4ECE7FFE5D9
      DCFF281C9BFF8494E7FF7981DDFF222052AC00000000AB5889FFAB5889FFFFFF
      FFFFFFFFFFFFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFFFFF
      FFFFFFFFFFFFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000403022BC4926AFCF5E8CCFFEFD6
      ABFFF1D8AEFFF2DAB0FFA56A3EFFDECFC9FFDFD1CBFFA56A3EFFF3DCB2FFF1DB
      B0FFF1D8ADFFF7EACDFFC2916DFA0403022E030307356566CDFC9EACEDFF676E
      CEFF5545A1FFCCB6BCFF7967A8FF4B49B6FF4C4AB7FF7967A8FFCBB5BCFF5545
      A1FF656CCCFF9BAAEEFF676ACEFD0404093F00000000AB5889FFAB5889FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000033F2E2292D7B08CFFF8EF
      D3FFF3E0B9FFF3DFB7FFB98A5EFFA56A3EFFA56A3EFFBA8A5EFFF4E1B9FFF4E2
      BDFFFAF1D5FFD9B390FF37291D8C0000000600000004222247977C84DFFFA5B6
      F1FF6C73D0FF2C209BFF5050B9FF8EA2ECFF8EA1ECFF5151BBFF2C209BFF6A71
      D0FFA2B3F0FF8086E0FF292A56A70000000800000000AB5889FFAB5889FFFFFF
      FFFFFFFFFFFFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFFFFF
      FFFFFFFFFFFFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000007684D38B8D9B3
      8FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7ECCAFFF8EED0FFF4E8
      CDFFD7AF8BFF5F4733B30000000B00000001000000010000000C393A74BC8087
      E2FFAEBDF3FFA3B6F1FF9DAFF0FF95A9EEFF95A8EEFF9BADEFFFA2B3F0FFACBC
      F3FF838AE3FF3B3D79C1000000110000000200000000AB5889FFAB5889FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000073E2E
      238FCC9E76FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8B9FFE3C5A3FFBB91
      6CF21E1610670000000600000001000000000000000000000001000000051718
      2F796F74D3F8929CEAFFA1AEEFFFB0BFF3FFB0BFF4FFA2AEEFFF939DE9FF7075
      D4F81819307D00000008000000020000000000000000AB5889FFAB5889FFAB58
      89FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB5889FFAB58
      89FFAB5889FFAB5889FFAB5889FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      00020504032C392C218983644BCCBA8F69F1B48B68EE84644CCD3A2D228B0202
      0122000000030000000100000000000000000000000000000000000000000000
      00030303062D242647934B4E93D07176DCFC7176DCFC4B4E93D0252648950303
      0630000000040000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
