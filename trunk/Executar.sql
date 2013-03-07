UPDATE layout_campos SET empresa = (SELECT FIRST 1 empresa FROM layouts WHERE layouts.chave = layout_campos.layout)
