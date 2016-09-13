namespace puntoVenta
{
    partial class cuenta_por_pagar_suplidores
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(cuenta_por_pagar_suplidores));
            this.panel3 = new System.Windows.Forms.Panel();
            this.button6 = new System.Windows.Forms.Button();
            this.button7 = new System.Windows.Forms.Button();
            this.button8 = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.codigo_compra = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.numero_factura = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.codigo_tipo_compra = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fecha_inicial = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ncf = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.rnc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fecha_limite = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.monto_pendiente = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.numero_factura_txt = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.nombre_suplidor_txt = new System.Windows.Forms.TextBox();
            this.codigo_suplidor_txt = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.button4 = new System.Windows.Forms.Button();
            this.detalle_txt = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.monto_pago_txt = new System.Windows.Forms.TextBox();
            this.monto_factura_txt = new System.Windows.Forms.TextBox();
            this.nombre_cajero_txt = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.codigo_cajero_txt = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.fecha = new System.Windows.Forms.DateTimePicker();
            this.panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // panel3
            // 
            this.panel3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel3.BackColor = System.Drawing.Color.WhiteSmoke;
            this.panel3.Controls.Add(this.button6);
            this.panel3.Controls.Add(this.button7);
            this.panel3.Controls.Add(this.button8);
            this.panel3.Location = new System.Drawing.Point(12, 518);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(890, 55);
            this.panel3.TabIndex = 80;
            // 
            // button6
            // 
            this.button6.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.button6.BackgroundImage = global::puntoVenta.Properties.Resources.map_icon;
            this.button6.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.button6.Location = new System.Drawing.Point(416, 0);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(71, 55);
            this.button6.TabIndex = 2;
            this.button6.UseVisualStyleBackColor = true;
            this.button6.Click += new System.EventHandler(this.button6_Click);
            // 
            // button7
            // 
            this.button7.BackgroundImage = global::puntoVenta.Properties.Resources.edit_not_validated1;
            this.button7.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.button7.Location = new System.Drawing.Point(0, 0);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(74, 55);
            this.button7.TabIndex = 1;
            this.button7.UseVisualStyleBackColor = true;
            this.button7.Click += new System.EventHandler(this.button7_Click);
            // 
            // button8
            // 
            this.button8.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.button8.BackgroundImage = global::puntoVenta.Properties.Resources.save_file_disk_open_searsh_loading_clipboard_1513;
            this.button8.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.button8.Location = new System.Drawing.Point(818, 0);
            this.button8.Name = "button8";
            this.button8.Size = new System.Drawing.Size(72, 55);
            this.button8.TabIndex = 0;
            this.button8.UseVisualStyleBackColor = true;
            this.button8.Click += new System.EventHandler(this.button8_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Black;
            this.label3.Location = new System.Drawing.Point(697, 91);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(67, 25);
            this.label3.TabIndex = 76;
            this.label3.Text = "Monto";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AllowUserToResizeColumns = false;
            this.dataGridView1.AllowUserToResizeRows = false;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.BackgroundColor = System.Drawing.Color.White;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.codigo_compra,
            this.numero_factura,
            this.codigo_tipo_compra,
            this.fecha_inicial,
            this.ncf,
            this.rnc,
            this.fecha_limite,
            this.monto_pendiente});
            this.dataGridView1.Location = new System.Drawing.Point(12, 119);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowHeadersVisible = false;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(890, 214);
            this.dataGridView1.TabIndex = 75;
            this.dataGridView1.SelectionChanged += new System.EventHandler(this.dataGridView1_SelectionChanged);
            // 
            // codigo_compra
            // 
            this.codigo_compra.FillWeight = 40F;
            this.codigo_compra.HeaderText = "Codigo";
            this.codigo_compra.Name = "codigo_compra";
            this.codigo_compra.ReadOnly = true;
            // 
            // numero_factura
            // 
            this.numero_factura.HeaderText = "Factura";
            this.numero_factura.Name = "numero_factura";
            this.numero_factura.ReadOnly = true;
            // 
            // codigo_tipo_compra
            // 
            this.codigo_tipo_compra.FillWeight = 50F;
            this.codigo_tipo_compra.HeaderText = "Compra";
            this.codigo_tipo_compra.Name = "codigo_tipo_compra";
            this.codigo_tipo_compra.ReadOnly = true;
            // 
            // fecha_inicial
            // 
            this.fecha_inicial.FillWeight = 80F;
            this.fecha_inicial.HeaderText = "Fecha";
            this.fecha_inicial.Name = "fecha_inicial";
            this.fecha_inicial.ReadOnly = true;
            // 
            // ncf
            // 
            this.ncf.HeaderText = "NCF";
            this.ncf.Name = "ncf";
            this.ncf.ReadOnly = true;
            // 
            // rnc
            // 
            this.rnc.FillWeight = 70F;
            this.rnc.HeaderText = "RNC";
            this.rnc.Name = "rnc";
            this.rnc.ReadOnly = true;
            // 
            // fecha_limite
            // 
            this.fecha_limite.HeaderText = "Fecha Limite";
            this.fecha_limite.Name = "fecha_limite";
            this.fecha_limite.ReadOnly = true;
            // 
            // monto_pendiente
            // 
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.TopRight;
            this.monto_pendiente.DefaultCellStyle = dataGridViewCellStyle1;
            this.monto_pendiente.HeaderText = "Pendiente";
            this.monto_pendiente.Name = "monto_pendiente";
            this.monto_pendiente.ReadOnly = true;
            // 
            // numero_factura_txt
            // 
            this.numero_factura_txt.Location = new System.Drawing.Point(445, 95);
            this.numero_factura_txt.Name = "numero_factura_txt";
            this.numero_factura_txt.ReadOnly = true;
            this.numero_factura_txt.Size = new System.Drawing.Size(105, 20);
            this.numero_factura_txt.TabIndex = 73;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Black;
            this.label2.Location = new System.Drawing.Point(368, 93);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(78, 25);
            this.label2.TabIndex = 72;
            this.label2.Text = "Factura";
            // 
            // nombre_suplidor_txt
            // 
            this.nombre_suplidor_txt.Location = new System.Drawing.Point(195, 96);
            this.nombre_suplidor_txt.Name = "nombre_suplidor_txt";
            this.nombre_suplidor_txt.ReadOnly = true;
            this.nombre_suplidor_txt.Size = new System.Drawing.Size(134, 20);
            this.nombre_suplidor_txt.TabIndex = 71;
            // 
            // codigo_suplidor_txt
            // 
            this.codigo_suplidor_txt.Location = new System.Drawing.Point(93, 97);
            this.codigo_suplidor_txt.Name = "codigo_suplidor_txt";
            this.codigo_suplidor_txt.ReadOnly = true;
            this.codigo_suplidor_txt.Size = new System.Drawing.Size(49, 20);
            this.codigo_suplidor_txt.TabIndex = 69;
            this.codigo_suplidor_txt.TextChanged += new System.EventHandler(this.codigo_suplidor_txt_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Black;
            this.label1.Location = new System.Drawing.Point(12, 91);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(84, 25);
            this.label1.TabIndex = 68;
            this.label1.Text = "Suplidor";
            // 
            // button4
            // 
            this.button4.BackgroundImage = global::puntoVenta.Properties.Resources.find_icon;
            this.button4.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.button4.Location = new System.Drawing.Point(147, 87);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(34, 30);
            this.button4.TabIndex = 70;
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // detalle_txt
            // 
            this.detalle_txt.Location = new System.Drawing.Point(12, 364);
            this.detalle_txt.MaxLength = 100;
            this.detalle_txt.Multiline = true;
            this.detalle_txt.Name = "detalle_txt";
            this.detalle_txt.Size = new System.Drawing.Size(890, 148);
            this.detalle_txt.TabIndex = 81;
            this.detalle_txt.Text = "PAGO DE FACTURA";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Black;
            this.label4.Location = new System.Drawing.Point(7, 336);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(173, 25);
            this.label4.TabIndex = 83;
            this.label4.Text = "Concepto de pago";
            // 
            // monto_pago_txt
            // 
            this.monto_pago_txt.Location = new System.Drawing.Point(770, 95);
            this.monto_pago_txt.Name = "monto_pago_txt";
            this.monto_pago_txt.Size = new System.Drawing.Size(132, 20);
            this.monto_pago_txt.TabIndex = 84;
            this.monto_pago_txt.KeyUp += new System.Windows.Forms.KeyEventHandler(this.monto_txt_KeyUp);
            // 
            // monto_factura_txt
            // 
            this.monto_factura_txt.Location = new System.Drawing.Point(554, 95);
            this.monto_factura_txt.Name = "monto_factura_txt";
            this.monto_factura_txt.ReadOnly = true;
            this.monto_factura_txt.Size = new System.Drawing.Size(105, 20);
            this.monto_factura_txt.TabIndex = 85;
            // 
            // nombre_cajero_txt
            // 
            this.nombre_cajero_txt.Location = new System.Drawing.Point(18, 57);
            this.nombre_cajero_txt.Name = "nombre_cajero_txt";
            this.nombre_cajero_txt.ReadOnly = true;
            this.nombre_cajero_txt.Size = new System.Drawing.Size(163, 20);
            this.nombre_cajero_txt.TabIndex = 89;
            // 
            // button1
            // 
            this.button1.BackgroundImage = global::puntoVenta.Properties.Resources.find_icon;
            this.button1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.button1.Location = new System.Drawing.Point(148, 25);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(34, 30);
            this.button1.TabIndex = 88;
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // codigo_cajero_txt
            // 
            this.codigo_cajero_txt.Location = new System.Drawing.Point(94, 35);
            this.codigo_cajero_txt.Name = "codigo_cajero_txt";
            this.codigo_cajero_txt.ReadOnly = true;
            this.codigo_cajero_txt.Size = new System.Drawing.Size(49, 20);
            this.codigo_cajero_txt.TabIndex = 87;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.Black;
            this.label5.Location = new System.Drawing.Point(13, 29);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(70, 25);
            this.label5.TabIndex = 86;
            this.label5.Text = "Cajero";
            // 
            // fecha
            // 
            this.fecha.Enabled = false;
            this.fecha.Location = new System.Drawing.Point(702, 12);
            this.fecha.Name = "fecha";
            this.fecha.Size = new System.Drawing.Size(200, 20);
            this.fecha.TabIndex = 90;
            // 
            // cuenta_por_pagar_suplidores
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(924, 585);
            this.Controls.Add(this.fecha);
            this.Controls.Add(this.nombre_cajero_txt);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.codigo_cajero_txt);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.monto_factura_txt);
            this.Controls.Add(this.monto_pago_txt);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.detalle_txt);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.numero_factura_txt);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.nombre_suplidor_txt);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.codigo_suplidor_txt);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "cuenta_por_pagar_suplidores";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Cuenta por pagar suplidores";
            this.Load += new System.EventHandler(this.cuenta_por_pagar_suplidores_Load);
            this.panel3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Button button7;
        private System.Windows.Forms.Button button8;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.TextBox numero_factura_txt;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox nombre_suplidor_txt;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.TextBox codigo_suplidor_txt;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox detalle_txt;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox monto_pago_txt;
        private System.Windows.Forms.TextBox monto_factura_txt;
        private System.Windows.Forms.DataGridViewTextBoxColumn codigo_compra;
        private System.Windows.Forms.DataGridViewTextBoxColumn numero_factura;
        private System.Windows.Forms.DataGridViewTextBoxColumn codigo_tipo_compra;
        private System.Windows.Forms.DataGridViewTextBoxColumn fecha_inicial;
        private System.Windows.Forms.DataGridViewTextBoxColumn ncf;
        private System.Windows.Forms.DataGridViewTextBoxColumn rnc;
        private System.Windows.Forms.DataGridViewTextBoxColumn fecha_limite;
        private System.Windows.Forms.DataGridViewTextBoxColumn monto_pendiente;
        private System.Windows.Forms.TextBox nombre_cajero_txt;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox codigo_cajero_txt;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DateTimePicker fecha;
    }
}