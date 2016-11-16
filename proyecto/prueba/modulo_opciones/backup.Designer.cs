namespace puntoVenta.modulo_opciones
{
    partial class backup
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
            this.ckSistema = new System.Windows.Forms.CheckBox();
            this.ckBaseDatos = new System.Windows.Forms.CheckBox();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // ckSistema
            // 
            this.ckSistema.AutoSize = true;
            this.ckSistema.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.ckSistema.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ckSistema.Location = new System.Drawing.Point(20, 32);
            this.ckSistema.Name = "ckSistema";
            this.ckSistema.Size = new System.Drawing.Size(80, 24);
            this.ckSistema.TabIndex = 0;
            this.ckSistema.Text = "sistema";
            this.ckSistema.UseVisualStyleBackColor = true;
            // 
            // ckBaseDatos
            // 
            this.ckBaseDatos.AutoSize = true;
            this.ckBaseDatos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.ckBaseDatos.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ckBaseDatos.Location = new System.Drawing.Point(20, 82);
            this.ckBaseDatos.Name = "ckBaseDatos";
            this.ckBaseDatos.Size = new System.Drawing.Size(104, 24);
            this.ckBaseDatos.TabIndex = 1;
            this.ckBaseDatos.Text = "base datos";
            this.ckBaseDatos.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.BackgroundImage = global::puntoVenta.Properties.Resources.save_file_disk_open_searsh_loading_clipboard_15131;
            this.button1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Location = new System.Drawing.Point(419, 235);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(72, 61);
            this.button1.TabIndex = 2;
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.ckSistema);
            this.groupBox1.Controls.Add(this.ckBaseDatos);
            this.groupBox1.Location = new System.Drawing.Point(12, 30);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(479, 135);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            // 
            // backup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(503, 308);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.button1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "backup";
            this.Text = "backup";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.CheckBox ckSistema;
        private System.Windows.Forms.CheckBox ckBaseDatos;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.GroupBox groupBox1;
    }
}