document.addEventListener('DOMContentLoaded', () => {
  const contactForm = document.getElementById('contactForm');
  const submissionsContainer = document.getElementById('submissions');
  
  // Fungsi untuk memformat tanggal
  const formatDate = (dateString) => {
    const options = { 
      year: 'numeric', 
      month: 'long', 
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    };
    return new Date(dateString).toLocaleDateString('id-ID', options);
  };
  
  // Fungsi untuk menampilkan data formulir
  const displaySubmissions = (submissions) => {
    submissionsContainer.innerHTML = '';
    
    if (submissions.length === 0) {
      submissionsContainer.innerHTML = '<p>Belum ada pesan yang dikirim.</p>';
      return;
    }
    
    submissions.forEach(submission => {
      const card = document.createElement('div');
      card.className = 'submission-card';
      
      card.innerHTML = `
        <h3>${submission.name}</h3>
        <p><strong>Email:</strong> ${submission.email}</p>
        <p><strong>Pesan:</strong> ${submission.message}</p>
        <p class="date">Dikirim pada: ${formatDate(submission.createdAt)}</p>
      `;
      
      submissionsContainer.appendChild(card);
    });
  };
  
  // Fungsi untuk mengambil data formulir dari server
  const fetchSubmissions = async () => {
    try {
      const response = await fetch('/api/forms');
      const data = await response.json();
      
      if (data.success) {
        displaySubmissions(data.data);
      } else {
        console.error('Gagal mengambil data:', data.message);
      }
    } catch (error) {
      console.error('Error:', error);
    }
  };
  
  // Fungsi untuk mengirim data formulir ke server
  const submitForm = async (formData) => {
    try {
      const response = await fetch('/api/forms', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
      });
      
      const data = await response.json();
      
      if (data.success) {
        // Reset form
        contactForm.reset();
        
        // Refresh data
        fetchSubmissions();
        
        alert('Pesan berhasil dikirim!');
      } else {
        alert(`Gagal mengirim pesan: ${data.message}`);
      }
    } catch (error) {
      console.error('Error:', error);
      alert('Terjadi kesalahan saat mengirim pesan.');
    }
  };
  
  // Event listener untuk form submission
  contactForm.addEventListener('submit', (e) => {
    e.preventDefault();
    
    const formData = {
      name: document.getElementById('name').value,
      email: document.getElementById('email').value,
      message: document.getElementById('message').value
    };
    
    submitForm(formData);
  });
  
  // Ambil data saat halaman dimuat
  fetchSubmissions();
});