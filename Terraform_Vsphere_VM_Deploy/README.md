# Terraform vSphere VM Deploy Kullanım Kılavuzu

🖥️ Terraform vSphere VM Deploy
Bu proje, VMware vSphere ortamında Terraform kullanarak sanal makineler (VM) oluşturmak için hazırlanmıştır.

# Proje Dosya Yapısı
`````` (backtick)

📂 Terraform_Vsphere_VM_Deploy
 ├── 📂 modules
 │   └── 📂 vsphere_vm
 │       ├── 📄 main.tf
 │       ├── 📄 outputs.tf
 │       └── 📄 variables.tf
 ├── 📄 main.tf
 ├── 📄 provider.tf
 ├── 📄 README.md
 ├── 📄 terraform.tfvars
 └── 📄 variables.tf
``````

# Gereksinimler
Projeyi kullanmaya başlamadan önce aşağıdaki gereksinimlerin yüklü olduğundan emin olun.

1. İşletim sisteminin güncel olduğundan emin olun:
```bash
sudo apt update && sudo apt upgrade -y
```
2. Bağımlılıkları kurun
```bash
sudo apt install gnupg software-properties-common -y
```
3. Terraform’u repo listesine ekleyin
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```
```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```
4. Repo listesi değişikliklerini uygulayın
```bash
sudo apt update
```
5. Aşağıdaki komut ile Terraform'u kurun
```bash
sudo apt install terraform -y
```

# vSphere Bilgilerini Yapılandırma
1. `terraform.tfvars` dosyasında aşağıdaki bilgileri düzenleyin. (Dosya içerisinde örnek bilgiler mevcut.)

```bash
vsphere_user           = "terraform@vsphere.local"
vsphere_password       = "parola"
vsphere_server         = "vcenter-server"
datacenter_name        = "Datacenter-1"
cluster_name           = "Cluster-1"
network_name           = "VM Network"
template_name          = "Ubuntu-Template"
resource_pool_name     = "Resources"
datastore_name         = "Datastore-1"
vm_name                = "Terraform-Tes"
vm_cpu                 = 2
vm_memory              = 4096

```

# Terraform Komutları
Projeyi uygulamak için aşağıdaki Terraform komutlarını sırasıyla çalıştırın

✅ Terraform Initialize (Başlangıç ayarlarını oluşturur)
```bash
terraform init
```

✅ Terraform Plan (Yapılacak değişiklikleri gösterir)
```bash
terraform plan
```

✅ Terraform Apply (Değişiklikleri uygular)
```bash
terraform apply
```

✅ Terraform Destroy (Oluşturulan kaynakları siler)
```bash
terraform destroy
```

# Parametrik VM Deploy Komutu
Aşağıdaki komut'u düzenleyerek sanal makineleri parametre vererek hızlıca deploy edebilirsiniz

```bash
terraform apply \
  -var="vm_name=CK_AUTOVM" \
  -var="cpu=4" \
  -var="memory=8192" \
  -var="network_name=VM Network" \
  -var="host_name=esxi3.cekino.local" \
  -var="template_name=sL0-UbuntuSrv24Template" \
  -var="datacenter_id=datacenter-3"
```

# vSphere Web Client Kontrolü
Terraform işlemi tamamlandıktan sonra vSphere Web Client'ta aşağıdaki işlemleri kontrol edin.

✅ Sanal Makinenin başarılı şekilde oluşturulduğunu doğrulayın.

✅ IP adresi, CPU, RAM gibi değerlerin doğru yapılandırıldığını kontrol edin.