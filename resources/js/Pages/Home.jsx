import React, { useState } from 'react'
import Layout from '../components/Layout'
import CKEditor from '../components/CKEditor';

function Home() {
  const [content, setContent] = useState('');

  const handleEditorChange = (data) => {
      setContent(data);
  };
  return (
   <Layout>
     <>
        <div className="" >
          <CKEditor value={content} onChange={handleEditorChange}/>
        </div>
    </>
   </Layout>
  )
}

export default Home